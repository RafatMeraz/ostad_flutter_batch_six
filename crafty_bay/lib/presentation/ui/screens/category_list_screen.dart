import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
            if (categoryListController.inProgress) {
              return const CenteredCircularProgressIndicator();
            } else if (categoryListController.errorMessage != null) {
              return Center(
                child: Text(categoryListController.errorMessage!),
              );
            }

            return GridView.builder(
              itemCount: categoryListController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  categoryModel: categoryListController.categoryList[index],
                );
              },
            );
          }),
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
