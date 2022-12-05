import 'package:get/get.dart';

import '../controllers/share_screen_controller.dart';

class ShareScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ShareScreenController(),
    );
  }
}
