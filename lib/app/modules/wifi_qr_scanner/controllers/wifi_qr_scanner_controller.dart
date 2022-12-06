import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class WifiQrScannerController extends GetxController {
  //TODO: Implement WifiQrScannerController
  RxBool flashOn = false.obs;
  QRViewController? qrViewController;
  Barcode? result;
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

  void onQRViewCreated(QRViewController controller) {
    qrViewController=controller;
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        if(result!=null){
          print(result);
        }

  });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {

      qrViewController!.resumeCamera();
    if (!p) {
      Get.snackbar("No Permission", "please allow permission to use this feature");
    }
  }
  void flashToggle(){
    if(qrViewController!=null){
      qrViewController!.toggleFlash();
      flashOn.value=!flashOn.value;
    }
    else{
      flashOn.value=false;
    }

  }
  @override
  void reassemble() {
    // super.reassemble();
    if (Platform.isAndroid) {
        qrViewController!.resumeCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
  }
  void onCamera(){
    qrViewController!.resumeCamera();
  }
}
