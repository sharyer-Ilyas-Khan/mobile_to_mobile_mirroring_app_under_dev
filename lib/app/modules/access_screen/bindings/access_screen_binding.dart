import 'package:get/get.dart';

import '../controllers/access_screen_controller.dart';

class AccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessScreenController>(
      () => AccessScreenController(),
    );
  }
}
