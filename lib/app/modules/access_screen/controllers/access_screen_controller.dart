import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class AccessScreenController extends GetxController {
  //TODO: Implement AccessScreenController
  RxBool switchValue = false.obs;
  RxBool isCodeAvailable=false.obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;
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
  void toggle(){
    if(switchValue.value==true){
      switchValue.value=false;
    }
    else{
      switchValue.value=true;
    }
  }
  void updatePinController(){

  }
  void pasteCode()async {

    Clipboard.getData(Clipboard.kTextPlain).then((value){
      if(value==null){
        Get.snackbar("Failed","Nothing to paste",
            backgroundColor: Colors.black87,
            snackPosition:SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white
        );
      }
      else{
        // pinController.value.text= value.text.toString();
        pinController.value.setText(value.text!);
        isCodeAvailable.value=true;
      }

    });

  }
}
