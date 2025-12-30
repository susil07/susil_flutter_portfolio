
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:susil_flutter_portfolio/models/project.dart';
import 'package:susil_flutter_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const double _mobileBreakpoint = 600;

  static const List<Project> _projects = [
    Project(
      title: "Flutter Portfolio",
      description:
          "A responsive portfolio website built with Flutter Web, featuring dark mode and clean architecture.",
      techStack: ["Flutter", "Dart", "Web"],
    ),
    Project(
      title: "E-Commerce App",
      description:
          "Full-featured shopping app with cart, payment integration, and Firebase backend.",
      techStack: ["Flutter", "Firebase", "Stripe"],
    ),
    Project(
      title: "Task Management Tool",
      description:
          "Productivity app for teams to track tasks and collaborate in real-time.",
      techStack: ["Flutter", "Node.js", "Socket.io"],
    ),
    Project(
      title: "Weather Dashboard",
      description:
          "Real-time weather tracking application using OpenWeatherMap API.",
      techStack: ["Flutter", "REST API", "Geolocator"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < _mobileBreakpoint;

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

            /// 📱 Mobile → auto scrolling carousel
            if (isMobile)
              _AutoScrollProjectCarousel(projects: _projects)

            /// 🖥 Desktop → wrap layout
            else
             SizedBox(
  width: double.infinity,
  child: LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;

      int crossAxisCount = 2;
      if (width >= 900) crossAxisCount = 3;
      if (width >= 1200) crossAxisCount = 4;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.25, // tweak if needed
        ),
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: _projects[index]);
        },
      );
    },
  ),
),

          ],
        );
      },
    );
  }
}
class _AutoScrollProjectCarousel extends StatefulWidget {
  final List<Project> projects;

  const _AutoScrollProjectCarousel({
    required this.projects,
  });

  @override
  State<_AutoScrollProjectCarousel> createState() =>
      _AutoScrollProjectCarouselState();
}

class _AutoScrollProjectCarouselState
    extends State<_AutoScrollProjectCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.85);

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;

      _currentPage = (_currentPage + 1) % widget.projects.length;

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // enough for ProjectCard content
      child: PageView.builder(
        controller: _controller,
        padEnds: false,
        itemCount: widget.projects.length,
        itemBuilder: (context, index) {
          final project = widget.projects[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProjectCard(project: project),
          );
        },
      ),
    );
  }
}
