import 'package:flutter/material.dart';

class FadeSlide extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;

  const FadeSlide({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 500),
    this.beginOffset = const Offset(0, 0.05),
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        final isVisible = snapshot.connectionState == ConnectionState.done;

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: isVisible ? 1 : 0),
          duration: duration,
          curve: Curves.easeOut,
          builder: (context, value, _) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(
                  beginOffset.dx * (1 - value) * 100,
                  beginOffset.dy * (1 - value) * 100,
                ),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
