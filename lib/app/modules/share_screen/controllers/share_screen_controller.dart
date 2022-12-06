import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreenController extends GetxController {
  //TODO: Implement ShareScreenController

  RxBool switchValue = false.obs;
  RxBool copyOrShare=false.obs;
  RxBool sharingStared=false.obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;
  @override
  void onInit() {
    assignCode();
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
  void assignCode(){
    pinController.value.setText("3522");
  }
  void shareCode(){
    Share.share("This is your Code : ${pinController.value.text}");
    copyOrShare.value=true;
  }
  void copyCode(){

    Clipboard.setData(ClipboardData(text:pinController.value.text));
    Get.snackbar("Success","your code has been copied",
    backgroundColor: Colors.black87,
      snackPosition:SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white
    );
    copyOrShare.value=true;
  }


}
