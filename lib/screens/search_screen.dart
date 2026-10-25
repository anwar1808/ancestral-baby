import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_guides_toddler.dart';
import '../data/seed_meals.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import 'food_detail_screen.dart';

/// Search across foods, guides, and meals (§5).
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final q = _q.trim().toLowerCase();
    final foods = q.isEmpty
        ? []
        : state.foods
            .where((f) =>
                f.name.toLowerCase().contains(q) ||
                f.category.toLowerCase().contains(q))
            .toList();
    final guides = q.isEmpty
        ? []
        : kAllGuides
            .where((g) =>
                g.title.toLowerCase().contains(q) ||
                g.body.toLowerCase().contains(q))
            .toList();
    final meals = q.isEmpty
        ? []
        : kSeedMeals
            .where((m) =>
                m.title.toLowerCase().contains(q) ||
                m.description.toLowerCase().contains(q))
            .toList();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Search'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: TextField(
              autofocus: false,
              onChanged: (v) => setState(() => _q = v),
              decoration: const InputDecoration(
                hintText: 'Search foods, guides, meals',
                prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
              ),
            ),
          ),
          Expanded(
            child: q.isEmpty
                ? const Center(
                    child: Text('Type to search across the app',
                        style: TextStyle(color: AppColors.textMuted)),
                  )
                : ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    children: [
                      if (foods.isNotEmpty) ...[
                        const _Heading('Foods'),
                        ...foods.map((f) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.restaurant,
                                  color: AppColors.navy),
                              title: Text(f.name),
                              subtitle: Text('${f.category} · ${f.ageLabel}'),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      FoodDetailScreen(foodId: f.id),
                                ),
                              ),
                            )),
                      ],
                      if (guides.isNotEmpty) ...[
                        const _Heading('Guides'),
                        ...guides.map((g) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.menu_book,
                                  color: AppColors.navy),
                              title: Text(g.title),
                              subtitle: Text(g.section),
                            )),
                      ],
                      if (meals.isNotEmpty) ...[
                        const _Heading('Meals'),
                        ...meals.map((m) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.lunch_dining,
                                  color: AppColors.navy),
                              title: Text(m.title),
                              subtitle: Text(m.stage),
                            )),
                      ],
                      if (foods.isEmpty && guides.isEmpty && meals.isEmpty)
                        const Padding(
                          padding: EdgeInsets.only(top: AppSpacing.xxl),
                          child: Center(
                            child: Text('No results',
                                style:
                                    TextStyle(color: AppColors.textMuted)),
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md, bottom: 4),
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: AppColors.textMuted)),
    );
  }
}
