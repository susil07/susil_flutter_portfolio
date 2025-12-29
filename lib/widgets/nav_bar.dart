import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String) onItemTap;
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const NavBar({
    super.key,
    required this.onItemTap,
    required this.onThemeToggle,
    required this.currentThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Susil Kumar Dora",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Row(
                children: ['About', 'Services', 'Projects', 'Contact'].map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: TextButton(
                      onPressed: () => onItemTap(item),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(width: 24),
              IconButton(
                icon: Icon(
                  currentThemeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: onThemeToggle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
