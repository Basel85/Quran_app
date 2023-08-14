import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  const CustomSnackBar({super.key, required this.message, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(message,style: AppThemes.color0xFF300759FontSize13FontWeightW600,),backgroundColor: backgroundColor,);
  }
}
