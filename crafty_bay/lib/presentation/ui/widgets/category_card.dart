import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const ProductListScreen(categoryName: 'Electronics'),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.computer,
              size: 48,
              color: AppColors.themeColor,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Electronics',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
          )
        ],
      ),
    );
  }
}
