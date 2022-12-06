import 'dart:ui';

import 'package:get/get.dart';

class DialogsController extends GetxController {
  //TODO: Implement DialogsController
  final Rx<Color> pointerColor=const Color(0xffE83022).obs;
  @override
  void onInit() {
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
  void changeColor(Color color){
      pointerColor.value=color;
  }

}
