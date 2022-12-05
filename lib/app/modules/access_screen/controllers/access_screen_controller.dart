import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AccessScreenController extends GetxController {
  //TODO: Implement AccessScreenController
  RxBool switchValue = false.obs;
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
  void shareCode(){
    Share.share("This is your Code : ${pinController.value.text}");
  }
  void copyCode(){
    Clipboard.setData(ClipboardData(text:pinController.value.text));
    Get.snackbar("Success","your code has been copied",
        backgroundColor: Colors.black87,
        snackPosition:SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        colorText: Colors.white



    );
  }
}
