import 'package:flutter/material.dart';
import 'package:fish_chips/ui/theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.logoAssetPath});

  final String logoAssetPath;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 44,
              height: 44,
              child: Image.asset(logoAssetPath, fit: BoxFit.contain),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  style: tt.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
                  children: const [
                    TextSpan(text: 'Fish', style: TextStyle(color: AppTheme.fishBlue)),
                    TextSpan(text: '&', style: TextStyle(color: AppTheme.text)),
                    TextSpan(text: 'Chips', style: TextStyle(color: AppTheme.chipsYellow)),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Quiz-App • Fischflosse',
                style: tt.bodyMedium?.copyWith(color: AppTheme.text.withOpacity(0.75)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}