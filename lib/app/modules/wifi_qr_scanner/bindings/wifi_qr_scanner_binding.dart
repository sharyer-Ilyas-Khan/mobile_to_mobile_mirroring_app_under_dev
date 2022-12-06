import 'package:get/get.dart';

import '../controllers/wifi_qr_scanner_controller.dart';

class WifiQrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WifiQrScannerController>(
      () => WifiQrScannerController(),
    );
  }
}
