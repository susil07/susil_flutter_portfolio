import 'package:flutter/material.dart';

import 'package:susil_flutter_portfolio/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340, // Fixed width for Grid/Wrap consistency
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
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
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: project.techStack.map((tech) => Chip(
              label: Text(tech, style: const TextStyle(fontSize: 12)),
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            )).toList(),
          ),
          // Link can be added here if needed
        ],
      ),
    );
  }
}
