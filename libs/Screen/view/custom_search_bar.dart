import 'package:final_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding
    (padding:  EdgeInsets.all(16.0),
    child: TextField(
      style: AppTextStyle.withColor(
        AppTextStyle.buttonMedium,
        Theme.of( context).textTheme.bodyLarge?.color ?? Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Search products...',
        hintStyle : AppTextStyle.withColor(
        AppTextStyle.buttonMedium,
        isDark ? Colors.white70 : Colors.black54,
      ),

        prefixIcon: Icon(
          Icons.search, 
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,),
        suffixIcon: Icon(
          Icons.tune,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: isDark ? Colors.grey[400]! : const Color.fromARGB(255, 255, 255, 255),

      ),
    ) ,
    );
  }
}