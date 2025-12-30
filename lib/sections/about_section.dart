import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 24),
       Text(
  "I am a Flutter developer with over 3.6+ years of experience building high-quality cross-platform mobile applications and web applications. I focus on creating reliable, performant apps with a strong emphasis on user experience and code quality.",
  style: Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(fontSize: 16, height: 1.6),
),

        const SizedBox(height: 16),
       Text(
  "I specialize in building scalable applications using clean architecture and robust state management. My approach emphasizes maintainable, testable code and pixel-perfect UI implementation for both startup products and enterprise-scale applications.",
  style: Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(fontSize: 16, height: 1.6),
),

      ],
    );
  }
}
