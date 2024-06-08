import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dummy name',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          'email@gmail.com',
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    ),
    actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
  );
}
