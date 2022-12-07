import 'dart:ui';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/controllers/setting_screen_controller.dart';

class DialogsController extends GetxController {
  //TODO: Implement DialogsController
  final Rx<Color> pointerColor=const Color(0xffE83022).obs;
  final RxInt selectedIndex=0.obs;
  final SettingScreenController controller=Get.put(SettingScreenController());
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
  void checkSelectedIndex(index,color){
    if(selectedIndex!=index){
      selectedIndex.value=index;
      changeColor(color);

    }
  }

}
