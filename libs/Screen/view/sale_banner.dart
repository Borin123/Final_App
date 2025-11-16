import 'package:final_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // LEFT TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: AppTextStyle.withColor(
                    AppTextStyle.h3,
                    Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Special Sale',
                  style: AppTextStyle.withColor(
                    AppTextStyle.h2,
                    Colors.white,
                  ),
                ),
              ],
            
            ),
          ),

          // OPTIONAL IMAGE / ICON (you can remove if not needed)
          Icon(
            Icons.local_offer,
            size: 64,
            color: Colors.white.withOpacity(0.7),
          ),
        ],
        
      ),
    );
  }
}
