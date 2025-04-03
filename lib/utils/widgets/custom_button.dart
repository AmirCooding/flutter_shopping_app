import 'package:flutter/material.dart';
import 'package:ustore/gen/assets.gen.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isImage;
  final String? iconImage;

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    this.icon,
    this.iconColor = Colors.white,
    this.isImage = false,
    this.iconImage, // Bildpfad als String
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isImage && iconImage != null) ...[
            Image.asset(iconImage!, width: 24, height: 24),
            const SizedBox(width: 10),
          ] else if (icon != null) ...[
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 10),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
