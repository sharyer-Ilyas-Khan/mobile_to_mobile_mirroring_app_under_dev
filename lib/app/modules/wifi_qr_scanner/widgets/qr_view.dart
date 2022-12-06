import 'package:flutter/material.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/wifi_qr_scanner/controllers/wifi_qr_scanner_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
class BuildQrView extends StatelessWidget {
   BuildQrView({Key? key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    WifiQrScannerController controller=Get.put(WifiQrScannerController());
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (Get.width < 400 ||
        Get.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColors.darkBlue,
          borderRadius: 0,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300),
      onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
    );
  }
}
