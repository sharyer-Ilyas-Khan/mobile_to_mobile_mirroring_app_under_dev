import 'package:get/get.dart';

import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/controllers/access_room_controller.dart';

import '../controllers/access_screen_controller.dart';

class AccessScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccessRoomController(),
    );
    Get.put(AccessScreenController(),
    );
  }
}
