import 'package:flutter/material.dart';
import 'package:susil_flutter_portfolio/sections/about_section.dart';
import 'package:susil_flutter_portfolio/sections/contact_section.dart';
import 'package:susil_flutter_portfolio/sections/hero_section.dart';
import 'package:susil_flutter_portfolio/sections/projects_section.dart';


import 'package:susil_flutter_portfolio/sections/services_section.dart';
import 'package:susil_flutter_portfolio/widgets/mobile_drawer.dart';
import 'package:susil_flutter_portfolio/widgets/nav_bar.dart';
import 'package:susil_flutter_portfolio/widgets/section_container.dart';


class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.currentThemeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, GlobalKey> _sectionKeys = {
    'Hero': GlobalKey(),
    'About': GlobalKey(),
    'Services': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconTheme.of(context),
              title: const Text("SKD", style: TextStyle(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  icon: Icon(
                    widget.currentThemeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: widget.onThemeToggle,
                ),
              ],
            ),
      drawer: isDesktop ? null : MobileDrawer(onItemTap: _scrollToSection),
      body: Column(
        children: [
          if (isDesktop)
            NavBar(
              onItemTap: _scrollToSection,
              onThemeToggle: widget.onThemeToggle,
              currentThemeMode: widget.currentThemeMode,
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SectionContainer(
                    sectionKey: _sectionKeys['Hero'],
                    child: const HeroSection(),
                  ),
                  SectionContainer(
                    sectionKey: _sectionKeys['About'],
                    child: const AboutSection(),
                  ),
                  SectionContainer(
                    sectionKey: _sectionKeys['Services'],
                    child: const ServicesSection(),
                  ),
                  SectionContainer(
                    sectionKey: _sectionKeys['Projects'],
                    child: const ProjectsSection(),
                  ),
                  SectionContainer(
                    sectionKey: _sectionKeys['Contact'],
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
