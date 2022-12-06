import 'package:flutter/material.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/widgets/sharing_start_button.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';

import '../../../data/themesData.dart';
import '../controllers/share_screen_controller.dart';

class CodeGeneratedView extends StatelessWidget {
  const CodeGeneratedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShareScreenController controller=Get.put(ShareScreenController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  Padding(
          padding:  EdgeInsets.only(top: 15.0,bottom: 15.0,left: 20),
          child:  Text("Share this generated code to other user",style:readCodeTitle,),
        ),
        Center(
          child: Container(
            height: Get.height*0.18,
            width: Get.width*0.9,
            decoration: BoxDecoration(
              color: AppColors.codeCardColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow:const  [
                BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 5)
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 14.0,bottom: 14.0),
                  child: Text("Your Code",style: cardHeading,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40,),
                    Pinput(
                      controller: controller.pinController.value,
                      defaultPinTheme: defaultPinTheme,
                      readOnly: true,
                      //   focusedPinTheme: focusedPinTheme,
                    ),
                    const SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed:controller.copyCode, icon:const  Icon(Icons.copy,color: Colors.black54,size: 20,)),
                          IconButton(onPressed: controller.shareCode, icon:const  Icon(Icons.share,color: Colors.black54,size: 20,)),

                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),

          ),
        ),
        const SizedBox(height: 30,),
         Obx(() =>  Center(
             child:  controller.copyOrShare.value?
              Padding(
               padding:  EdgeInsets.only(left:Get.width*0.15,right: Get.width*0.15),
               child: const  Text("Please wait for a while, we are waiting for the other user to connect.",
                 textAlign: TextAlign.center,style: waitingText,),
             )
                 :Container()),),
        Obx(() =>   controller.sharingStared.value?
        const Center(child:   Text("Sharing started!",style: sharingStarted,)):Container()),
        const SizedBox(height: 30,),
        Obx(() =>   controller.sharingStared.value?
            const Center(child:  SharingStartButton()):Container()),

      ],
    );
  }
}
