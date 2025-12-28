import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:susil_flutter_portfolio/core/widgets/fade_slide.dart';
import '../../core/theme/theme_notifier.dart';
import '../../core/theme/app_font.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
final themeNotifier = context.watch<ThemeNotifier>();

return Scaffold(
  appBar: AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.surface,
    surfaceTintColor: Colors.transparent,
    actions: [
      IconButton(
        tooltip: 'Toggle theme',
        icon: const Icon(Icons.brightness_6),
        onPressed: themeNotifier.toggleTheme,
      ),
    ],
  ),
  body: SafeArea(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: isMobile
                  ? const _MobileLayout()
                  : const _DesktopLayout(),
            ),
          ),
        );
      },
    ),
  ),
);

  }
}

/* -------------------- MOBILE LAYOUT -------------------- */

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    FadeSlide(
      child: Text(
        'Susil Kumar Dora',
        textAlign: TextAlign.center,
        style: AppFont.bold.s32.primary(context),
      ),
    ),
    const SizedBox(height: 12),
    FadeSlide(
      delay: const Duration(milliseconds: 150),
      child: Text(
        'Flutter Full-Stack Developer',
        textAlign: TextAlign.center,
        style: AppFont.medium.s18.secondary(context),
      ),
    ),
    const SizedBox(height: 20),
    FadeSlide(
      delay: const Duration(milliseconds: 300),
      child: Text(
        'Building scalable Flutter apps for Web, Android & iOS.',
        textAlign: TextAlign.center,
        style: AppFont.regular.s14.primary(context),
      ),
    ),
  ],
);

  }
}

/* -------------------- DESKTOP LAYOUT -------------------- */

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 40),
        Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    FadeSlide(
      child: Text(
        'Susil Kumar Dora',
        style: AppFont.bold.s32.primary(context),
      ),
    ),
    const SizedBox(height: 16),
    FadeSlide(
      delay: const Duration(milliseconds: 150),
      child: Text(
        'Flutter Full-Stack Developer',
        style: AppFont.medium.s20.secondary(context),
      ),
    ),
    const SizedBox(height: 24),
    FadeSlide(
      delay: const Duration(milliseconds: 300),
      child: SizedBox(
        width: 400,
        child: Text(
          'Building scalable Flutter apps for Web, Android & iOS.',
          style: AppFont.regular.s16.primary(context),
        ),
      ),
    ),
  ],
)
      ],
    );
  }
}
