import 'package:get/get.dart';

import '../controllers/info_screen_controller.dart';

class InfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InfoScreenController());
  }
}
