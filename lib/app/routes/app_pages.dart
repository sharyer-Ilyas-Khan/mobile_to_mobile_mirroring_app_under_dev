import 'package:get/get.dart';

import '../modules/access_screen/bindings/access_screen_binding.dart';
import '../modules/access_screen/views/access_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info_screen/bindings/info_screen_binding.dart';
import '../modules/info_screen/views/info_screen_view.dart';
import '../modules/premium_screen/bindings/premium_screen_binding.dart';
import '../modules/premium_screen/views/premium_screen_view.dart';
import '../modules/setting_screen/bindings/setting_screen_binding.dart';
import '../modules/setting_screen/views/setting_screen_view.dart';
import '../modules/share_screen/bindings/share_screen_binding.dart';
import '../modules/share_screen/views/share_screen_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wifi_qr_scanner/bindings/wifi_qr_scanner_binding.dart';
import '../modules/wifi_qr_scanner/views/wifi_qr_scanner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INFO_SCREEN,
      page: () => const InfoScreenView(),
      binding: InfoScreenBinding(),
    ),
    GetPage(
      name: _Paths.SHARE_SCREEN,
      page: () => const ShareScreenView(),
      binding: ShareScreenBinding(),
    ),
    GetPage(
      name: _Paths.ACCESS_SCREEN,
      page: () => const AccessScreenView(),
      binding: AccessScreenBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM_SCREEN,
      page: () => const PremiumScreenView(),
      binding: PremiumScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_SCREEN,
      page: () => const SettingScreenView(),
      binding: SettingScreenBinding(),
    ),
    GetPage(
      name: _Paths.WIFI_QR_SCANNER,
      page: () => const WifiQrScannerView(),
      binding: WifiQrScannerBinding(),
    ),
  ];
}
