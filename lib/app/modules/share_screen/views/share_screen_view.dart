import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/widgets/code_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/widgets/share_audio_view.dart';

import '../controllers/share_screen_controller.dart';

class ShareScreenView extends GetView<ShareScreenController> {
  const ShareScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const Text('Share Screen',style: appBarHeading,),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
        ),
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset("Assets/lottie/crown_lottie.json",width: 40),
            ),
          )
        ],
      ),
      body: Column(
        children: [
           Expanded(child: AudioTile()),
          const Expanded(
              flex: 5,
              child:CodeGeneratedView()),
          Expanded(
              flex: 4,
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
