import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/text_styles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Center(child: SvgPicture.asset("Assets/svg/splash_img.svg")),
          const Text("Mobile To Mobile",style: splashHeading,),
          const Text("Mirroring",style: splashSubHeading,),
          Lottie.asset("Assets/lottie/loading.json",height: 120),
        ],
      ),
    );
  }
}
