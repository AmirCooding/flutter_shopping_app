import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ustore/gen/assets.gen.dart'; // falls du SVG nutzt

class ProfileImagePicker extends StatefulWidget {
  final void Function(String path)? onImagePicked;
  const ProfileImagePicker({super.key, this.onImagePicked});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      widget.onImagePicked?.call(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        backgroundImage:
            _selectedImage != null ? FileImage(_selectedImage!) : null,
        child: _selectedImage == null
            ? SvgPicture.asset(
                Assets.images.blankProfile,
                width: 50,
              )
            : null,
      ),
    );
  }
}
