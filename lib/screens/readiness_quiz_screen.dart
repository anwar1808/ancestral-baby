import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// "Is baby ready for solids?" quiz (§5). Free. Signs of readiness:
/// sitting with support + steady head control, reaching/grabbing, and interest.
class ReadinessQuizScreen extends StatefulWidget {
  const ReadinessQuizScreen({super.key});

  @override
  State<ReadinessQuizScreen> createState() => _ReadinessQuizScreenState();
}

class _ReadinessQuizScreenState extends State<ReadinessQuizScreen> {
  static const _questions = [
    'Can your baby sit upright with little or no support and hold their head steady?',
    'Does your baby reach for and grab objects, bringing them to their mouth?',
    'Has the tongue-thrust reflex faded — do they keep food in, rather than push it straight out?',
    'Does your baby show interest in food — watching you eat, leaning in, opening their mouth?',
  ];

  final Map<int, bool> _answers = {};
  bool _submitted = false;

  int get _yesCount => _answers.values.where((v) => v).length;

  @override
  Widget build(BuildContext context) {
    final ageMonths = context.watch<AppState>().baby?.correctedAgeInMonths ?? 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Readiness quiz')),
      body: _submitted
          ? _result(context, ageMonths)
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                const Text(
                  'Most babies are ready for solids around 6 months. These '
                  'signs help you judge readiness — they matter more than the '
                  'date on the calendar.',
                  style: TextStyle(color: AppColors.textSecondary, height: 1.4),
                ),
                const SizedBox(height: AppSpacing.lg),
                ...List.generate(_questions.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: InfoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_questions[i],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, height: 1.4)),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: _Choice(
                                  label: 'Yes',
                                  selected: _answers[i] == true,
                                  onTap: () => setState(() => _answers[i] = true),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _Choice(
                                  label: 'Not yet',
                                  selected: _answers[i] == false,
                                  onTap: () =>
                                      setState(() => _answers[i] = false),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: AppSpacing.md),
                PrimaryButton(
                  label: 'See result',
                  onPressed: _answers.length == _questions.length
                      ? () => setState(() => _submitted = true)
                      : null,
                ),
              ],
            ),
    );
  }

  Widget _result(BuildContext context, int ageMonths) {
    final ready = _yesCount >= 3 && ageMonths >= 5;
    final almostReady = _yesCount >= 3 && ageMonths < 5;
    String headline;
    String body;
    Color color;
    if (ready) {
      headline = 'Looks ready! 🎉';
      body =
          'Your baby shows the key signs of readiness. Start with single foods, '
          'go at their pace, and follow the age guidance for each food. Chat '
          'with your health visitor or paediatrician if you have any doubts.';
      color = AppColors.success;
    } else if (almostReady) {
      headline = 'Signs are there — but young';
      body =
          'Your baby shows readiness signs, but they\'re still quite young. '
          'Guidance is to wait until around 6 months. Check in with your '
          'paediatrician before starting.';
      color = AppColors.amber;
    } else {
      headline = 'Not quite yet';
      body =
          'A few readiness signs aren\'t there yet — that\'s completely normal. '
          'Keep offering chances to practise sitting and watching you eat, and '
          'try again in a week or two.';
      color = AppColors.amber;
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        InfoCard(
          color: color.withValues(alpha: 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headline,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w800, color: color)),
              const SizedBox(height: AppSpacing.sm),
              Text('$_yesCount of ${_questions.length} readiness signs present',
                  style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: AppSpacing.md),
              Text(body, style: const TextStyle(height: 1.5)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        PrimaryButton(
          label: 'Retake quiz',
          onPressed: () => setState(() {
            _submitted = false;
            _answers.clear();
          }),
        ),
      ],
    );
  }
}

class _Choice extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _Choice(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.navy : AppColors.softBlue,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: selected ? Colors.white : AppColors.navy,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
