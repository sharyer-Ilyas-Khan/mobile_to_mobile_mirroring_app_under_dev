import 'package:get/get.dart';

import '../controllers/premium_screen_controller.dart';

class PremiumScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PremiumScreenController>(
      () => PremiumScreenController(),
    );
  }
}
