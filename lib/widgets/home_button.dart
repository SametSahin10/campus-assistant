import 'package:campus_assistant/extensions.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      height: 65,
      child: ElevatedButton.icon(
        icon: Image.asset(iconPath, scale: 3.2),
        label: Container(
          width: context.width * 0.5,
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
