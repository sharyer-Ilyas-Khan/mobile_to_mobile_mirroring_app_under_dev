import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/widgets/color_picker.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/widgets/exit_app.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/widgets/rate_us.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../dialogs/widgets/feedback.dart';

class SettingScreenController extends GetxController {
  //TODO: Implement SettingScreenController

  final count = 0.obs;

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
void openDialog(tag){
    if(tag=="feedback"){
      Get.dialog( const FeedbackDialog(),
        barrierColor: Colors.transparent,

      );
    }
    if(tag=="rateUs"){
      Get.dialog( const RateUsDialog(),
        barrierColor: Colors.transparent,

      );
    }
    if(tag=="share"){
     Share.share("Hi,Check my app");
    }
    if(tag=="privacy"){
      launchUniversalLinkIos("https://sites.google.com/view/live-flight-tracker-litetc/home");

    }
    if(tag=="exit"){
      Get.dialog( const ExitDialog(),
        barrierColor: Colors.transparent,

      );
    }


}
void openColorPicker(){
  Get.dialog( const ColorPickerDiloge(),
    barrierColor: Colors.transparent,

  );
}
  Future<void> launchUniversalLinkIos(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      final bool nativeAppLaunchSucceeded = await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.platformDefault
      );
      if (!nativeAppLaunchSucceeded) {
        await launchUrl(Uri.parse(url),);
      }

    }
  }
}
