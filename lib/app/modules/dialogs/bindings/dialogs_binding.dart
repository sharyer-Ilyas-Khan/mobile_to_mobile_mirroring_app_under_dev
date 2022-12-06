import 'package:get/get.dart';

import '../controllers/dialogs_controller.dart';

class DialogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogsController>(
      () => DialogsController(),
    );
  }
}
