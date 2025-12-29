import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What I Do",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _buildServiceCard(context, "Mobile Apps", FontAwesomeIcons.mobile, "iOS & Android"),
            _buildServiceCard(context, "Web Development", FontAwesomeIcons.globe, "Flutter Web & React"),
            _buildServiceCard(context, "UI/UX Design", FontAwesomeIcons.penRuler, "Figma to Code"),
            _buildServiceCard(context, "Backend", FontAwesomeIcons.server, "Firebase & Node.js"),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, IconData icon, String subtitle) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            subtitle, 
            style: TextStyle(
              fontSize: 14, 
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)
            ),
          ),
        ],
      ),
    );
  }
}
