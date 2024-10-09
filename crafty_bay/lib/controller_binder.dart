import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(Logger());
    Get.put(AuthController());
    Get.put(NetworkCaller(
      logger: Get.find<Logger>(),
      authController: Get.find<AuthController>(),
    ));
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(NewProductListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductListByCategoryController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
  }
}