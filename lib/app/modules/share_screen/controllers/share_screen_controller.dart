import 'package:get/get.dart';

class ShareScreenController extends GetxController {
  //TODO: Implement ShareScreenController

  final count = 0.obs;
  RxBool switchValue = false.obs;
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

  void increment() => count.value++;
  void toggle(){
    if(switchValue.value==true){
      switchValue.value=false;
    }
    else{
      switchValue.value=true;
    }
  }
}
