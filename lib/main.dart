import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/notification_service.dart';
import 'screens/disclaimer_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/shell.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.init();
  final state = AppState();
  await state.load();
  runApp(AncestralBabyApp(state: state));
}

class AncestralBabyApp extends StatelessWidget {
  final AppState state;
  const AncestralBabyApp({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: state,
      child: MaterialApp(
        title: 'Ancestral Baby',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const _Root(),
      ),
    );
  }
}

/// Decides the first screen: disclaimer → onboarding → main shell (§5, §11).
class _Root extends StatelessWidget {
  const _Root();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    if (state.loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (!state.settings.disclaimerAccepted) {
      return const DisclaimerScreen();
    }
    if (!state.settings.onboardingComplete || state.baby == null) {
      return const OnboardingScreen();
    }
    return const AppShell();
  }
}
