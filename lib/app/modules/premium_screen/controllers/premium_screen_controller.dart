import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class PremiumScreenController extends GetxController {
  //TODO: Implement PremiumScreenController
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
