import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/info_screen/widgets/continueButton.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/info_screen/widgets/infoTile.dart';
import '../controllers/info_screen_controller.dart';

class InfoScreenView extends GetView<InfoScreenController> {
  final String? tag;
  const InfoScreenView({ this.tag,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap:(){
            Get.back();
            // controller.backToHome();
          },
          child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Lottie.asset("Assets/lottie/how_to_use.json",height: 150),),
                const Center(child: Text("How to use?",style: howToUseHeading,)),
                const InfoTiles(
                  title: "App on both devices",
                  subTitle: "This app must be installed on both devices(one whi share the screen & other who access it).",),
                 const InfoTiles(
                  title: "Generate code",
                  subTitle: "Share screen person needs to generate the code and send it to other person for screen sharing.",),
                 const InfoTiles(
                  title: "Access screen",
                  subTitle: "Remote user needs to paste the access code for screen access by clicking on remote screen button.",),
                const SizedBox(height: 20,),
                RichText(text: const TextSpan(
                  children:  [
                    TextSpan(
                      text: "Congratulations, ",
                      style: howToUseCongrats

                    ),
                    TextSpan(
                        text: "You have done successfully.",
                        style: howToUseCongratsSubHeading
                    )
                  ]
                )),
                ContinueButton(tag:tag),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.amber,
                child: const Center(
                  child: Text("nativeAd",style: splashHeading,),
                ),
              )),

        ],
      )
    );
  }
}
