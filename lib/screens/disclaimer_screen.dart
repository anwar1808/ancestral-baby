import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// First-run safety note (§11). Non-negotiable; shown before onboarding.
class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                ),
                child: const Center(
                  child: Icon(Icons.spa, size: 38, color: AppColors.navy),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('A note from us',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Ancestral Baby is not a medical app and does not replace your '
                'child\'s healthcare team.\n\n'
                'Everything here — food guidance, allergen timing, and the '
                'maintenance reminders — is general information grounded in '
                'public-health sources, not personal medical advice. Babies '
                'differ. Always follow the age guidance for each food, and '
                'discuss your child\'s diet, allergies, and any reactions with '
                'your paediatrician or health visitor.\n\n'
                'If your baby ever shows signs of a serious allergic reaction '
                '(trouble breathing; swelling of the lips, tongue, or throat; '
                'repeated vomiting; or lethargy), seek emergency help '
                'immediately.',
                style: TextStyle(
                    height: 1.5, color: AppColors.textSecondary, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                label: 'I understand',
                onPressed: () => context.read<AppState>().acceptDisclaimer(),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}
