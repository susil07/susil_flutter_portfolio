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
          "I am a passionate Flutter developer with over 3 years of experience building cross-platform applications. My journey started with native Android development before falling in love with Flutter's declarative UI and hot reload capabilities.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 16),
        Text(
          "I specialize in creating clean, maintainable code architectures and pixel-perfect UIs. Whether it's a startup MVP or a complex enterprise app, I focus on delivering seamless user experiences.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
        ),
      ],
    );
  }
}
