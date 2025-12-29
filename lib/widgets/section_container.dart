import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final GlobalKey? sectionKey;
  final Color? backgroundColor;

  const SectionContainer({
    super.key,
    required this.child,
    this.sectionKey,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
