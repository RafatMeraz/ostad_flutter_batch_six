import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.put(Logger());
    Get.put(NetworkCaller(logger: Get.find<Logger>()));
    Get.lazyPut(() => SliderListController());
    Get.lazyPut(() => CategoryListController());
    Get.lazyPut(() => NewProductListController());
    Get.lazyPut(() => PopularProductListController());
    Get.lazyPut(() => SpecialProductListController());
  }
}