import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../l10n/strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Center(
                child: Column(
                  children: const [
                    Icon(Icons.agriculture,
                        size: 64, color: AppColors.primary),
                    SizedBox(height: 12),
                    Text(
                      "Grameen Finance AI",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text("Simple finance for farmers"),
                  ],
                ),
              ),

              const Spacer(),

              Text("Choose Language"),
              const SizedBox(height: 8),

              Wrap(
                spacing: 10,
                children: const [
                  _LanguageChip("English", "en"),
                  _LanguageChip("हिंदी", "hi"),
                  _LanguageChip("বাংলা", "bn"),
                  _LanguageChip("தமிழ்", "ta"),
                  _LanguageChip("मराठी", "mr"),
                  _LanguageChip("ਪੰਜਾਬੀ", "pa"),
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.mic),
                  label: const Text("Continue with Voice"),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.lock_outline),
                  label: const Text("Continue with PIN"),
                  onPressed: () {},
                ),
              ),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Continue as Guest"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String label;
  final String code;

  const _LanguageChip(this.label, this.code);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: AppStrings.currentLang == code,
      onSelected: (_) {
        AppStrings.currentLang = code;
      },
    );
  }
}
