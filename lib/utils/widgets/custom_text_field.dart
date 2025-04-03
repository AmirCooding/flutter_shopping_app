import 'package:flutter/material.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final bool isOptional;
  final IconData? iconBefore;
  final IconData? iconAfter;
  final IconData? prefixIcon;
  final bool showIcon;
  final bool isSecure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.title,
    this.isOptional = false,
    this.iconBefore,
    this.iconAfter,
    this.showIcon = true,
    this.isSecure = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: isDarkMode ? AppFont.darkTitle : AppFont.ligthTitle,
              ),
              if (widget.isOptional)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          TextField(
            style: TextStyle(
              color: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
              fontFamily: AppFont.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            cursorColor: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
            cursorHeight: 14,
            controller: widget.controller,
            obscureText: widget.isSecure && !isPasswordVisible,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: Colors.grey)
                  : null,
              suffixIcon: widget.showIcon
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? widget.iconBefore
                            : widget.iconAfter,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.greyDark : AppColors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.greyDark : AppColors.grey,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.greyDark : AppColors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
