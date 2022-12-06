import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/widgets/option_tile.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/widgets/pointer_color.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/widgets/pointer_size.dart';

import '../../../data/text_styles.dart';
import '../../home/widgets/rainbow_line.dart';
import '../../premium_screen/views/premium_screen_view.dart';
import '../controllers/setting_screen_controller.dart';

class SettingScreenView extends GetView<SettingScreenController> {
  const SettingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading:InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset("Assets/svg/back_ic.svg",color: Colors.black,),
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Get.to(const PremiumScreenView());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Lottie.asset("Assets/lottie/crown_lottie.json",width: 40),
            ),
          )
        ],

        title:const Text("Settings",style: readCodeTitle,),

        centerTitle: false,
      ),
      body: Column(
        children:  [
          const RainbowLine(),
          Expanded(child: ListView(
            children: const [
              PointerColor(title: "Pointer color",svgIcon: "color_ic",),
              // PointerSize(title: "Pointer color",svgIcon: "pointer_ic",),
              OptionTilesForSetting(title: "Feedback",svgIcon: "feedback_ic",),
              OptionTilesForSetting(title: "Rate us",svgIcon: "star_ic",),
              OptionTilesForSetting(title: "Share App",svgIcon: "share_ic",),
              OptionTilesForSetting(title: "Privacy policy",svgIcon: "privacy_ic",),
              OptionTilesForSetting(title: "Exit",svgIcon: "exit",),

            ],
          ))
        ],
      )
    );
  }
}
