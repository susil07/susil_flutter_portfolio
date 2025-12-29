import 'package:flutter/material.dart';
import 'package:susil_flutter_portfolio/models/project.dart';
import 'package:susil_flutter_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Project> _projects = [
    Project(
      title: "Flutter Portfolio",
      description: "A responsive portfolio website built with Flutter Web, featuring dark mode and clean architecture.",
      techStack: ["Flutter", "Dart", "Web"],
    ),
    Project(
      title: "E-Commerce App",
      description: "Full-featured shopping app with cart, payment integration, and Firebase backend.",
      techStack: ["Flutter", "Firebase", "Stripe"],
    ),
    Project(
      title: "Task Management Tool",
      description: "Productivity app for teams to track tasks and collaborate in real-time.",
      techStack: ["Flutter", "Node.js", "Socket.io"],
    ),
    Project(
      title: "Weather Dashboard",
      description: "Real-time weather tracking application using OpenWeatherMap API.",
      techStack: ["Flutter", "REST API", "Geolocator"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured Projects",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: _projects.map((p) => ProjectCard(project: p)).toList(),
          ),
        ),
      ],
    );
  }
}
