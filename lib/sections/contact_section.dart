import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text(
                "Get In Touch",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16, 
                  height: 1.6,
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8)
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                   _ContactButton(
                    icon: Icons.email_outlined,
                    label: "Say Hello",
                    onTap: () => _launchUrl("mailto:susil@example.com"),
                  ),
                   _ContactButton(
                    icon: FontAwesomeIcons.linkedinIn,
                    label: "LinkedIn",
                    onTap: () => _launchUrl("https://linkedin.com/in/susil"),
                  ),
                   _ContactButton(
                    icon: FontAwesomeIcons.github,
                    label: "GitHub",
                    onTap: () => _launchUrl("https://github.com/susil"),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
        const Divider(),
        const SizedBox(height: 24),
        Text(
          "© 2024 Susil Kumar Dora. Built with Flutter.",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.5),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: BorderSide(color: Theme.of(context).dividerColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
