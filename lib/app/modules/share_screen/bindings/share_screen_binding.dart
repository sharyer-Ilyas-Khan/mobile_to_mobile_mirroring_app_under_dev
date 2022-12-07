import 'package:get/get.dart';

import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/controllers/create_room_controller.dart';

import '../controllers/share_screen_controller.dart';

class ShareScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
    CreateRoomController(),
    );
    Get.put(
      ShareScreenController(),
    );
  }
}
