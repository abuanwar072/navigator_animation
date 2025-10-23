import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    super.key,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  final IconData icon;
  final bool? isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: isActive! ? Color(0xFF2B2B2E) : Color(0xFFDAD9E4),
        child: Icon(icon, color: isActive! ? Colors.white : Colors.black),
      ),
    );
  }
}
