import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/home/widgets/access_code.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/home/widgets/rainbow_line.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/home/widgets/start_sharing.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/home/widgets/wifi_qr_scanner.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset("Assets/svg/ng_bar_ic.svg"),
          ),
        ),

        title:RichText(
          text:  TextSpan(
            children: <TextSpan>[
              const TextSpan(
                text: "M2M",
                style: splashHeading
              ),
              const TextSpan(
                  text: " MIRRORING\n",
                  style: splashSubHeading
              ),
              TextSpan(
                  text: "(Mobile to Mobile)",
                style: homeAppBarM2M

              )
            ]
          ),
          textAlign: TextAlign.center,

        ),
        centerTitle: true,
      ),
      body: Column(
        children:  [
           const RainbowLine(),
          const Expanded(
              child: WifiQrScanner()),
          const Expanded(
            flex: 2,
              child: StartScreenShare()),
          const Expanded(
            flex: 2,
              child: AccessCode()),
          Expanded(
            flex: 2,
              child: Container(
                color: Colors.amber,
                child: const Center(
                  child: Text("nativeAd",style: splashHeading,),
                ),
              )),

        ],
      ),
    );
  }
}
