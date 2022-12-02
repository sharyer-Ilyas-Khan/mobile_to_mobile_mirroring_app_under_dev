import 'dart:async';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
     goToNextScreen();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //void increment() => count.value++;

  //goto home
  void goToNextScreen() {
    print("I am calling onint");
    Timer(const Duration(seconds: 5), () {
      Get.off(const HomeView());
    });
  }
}
