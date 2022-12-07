import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/controllers/access_room_controller.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/widgets/code_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/widgets/connect_button.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/widgets/share_audio_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/premium_screen/views/premium_screen_view.dart';

import '../../../data/colors_codes.dart';
import '../../../data/text_styles.dart';
import '../controllers/access_screen_controller.dart';

class AccessScreenView extends GetView<AccessScreenController> {
  const AccessScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AccessRoomController accessRoomController=Get.put(AccessRoomController());
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: const Text('Remote Screen',style: appBarHeading,),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset("Assets/svg/back_ic.svg",color: Colors.black,),
            ),
          ),
          actions: [
            InkWell(
              onTap: (){
                Get.to(const PremiumScreenView());
              },
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
