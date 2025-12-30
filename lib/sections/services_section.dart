
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const double _mobileBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < _mobileBreakpoint;

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

            /// 📱 Mobile → auto horizontal scroll
            if (isMobile)
              const _AutoScrollServiceCarousel()

            /// 🖥 Desktop → wrap layout
            else
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: services
                      .map(
                        (e) => _buildServiceCard(
                          context,
                          e.title,
                          e.icon,
                          e.subtitle,
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}



class _AutoScrollServiceCarousel extends StatefulWidget {
  const _AutoScrollServiceCarousel();

  @override
  State<_AutoScrollServiceCarousel> createState() =>
      _AutoScrollServiceCarouselState();
}

class _AutoScrollServiceCarouselState
    extends State<_AutoScrollServiceCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.8);

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;

      _currentPage = (_currentPage + 1) % services.length;

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
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: _controller,
          padEnds: false,
          itemCount: services.length,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            final service = services[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _buildServiceCard(
                context,
                service.title,
                service.icon,
                service.subtitle,
                width: double.infinity,
              ),
            );
          },
        ),
      ),
    );
  }
}



Widget _buildServiceCard(
  BuildContext context,
  String title,
  IconData icon,
  String subtitle, {
  double width = 240,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  return Material(
    color: Colors.transparent, 
    child: Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔑 HEIGHT = CONTENT
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            icon,
            size: 24,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    ),
  );
}


class ServiceItem {
  final String title;
  final IconData icon;
  final String subtitle;

  const ServiceItem({
    required this.title,
    required this.icon,
    required this.subtitle,
  });
}

const List<ServiceItem> services = [
  ServiceItem(
    title: "Mobile Apps",
    icon: FontAwesomeIcons.mobile,
    subtitle: "iOS & Android",
  ),
  ServiceItem(
    title: "Web Development",
    icon: FontAwesomeIcons.globe,
    subtitle: "Flutter Web & React",
  ),
  ServiceItem(
    title: "UI/UX Design",
    icon: FontAwesomeIcons.penRuler,
    subtitle: "Figma to Code",
  ),
  ServiceItem(
    title: "Backend",
    icon: FontAwesomeIcons.server,
    subtitle: "Firebase & Node.js",
  ),
];
