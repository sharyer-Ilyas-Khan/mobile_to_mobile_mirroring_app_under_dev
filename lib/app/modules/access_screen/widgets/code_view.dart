import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';

import '../../../data/themesData.dart';
import '../controllers/access_screen_controller.dart';

class CodeGeneratedView extends StatelessWidget {
  const CodeGeneratedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccessScreenController controller=Get.put(AccessScreenController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  Padding(
          padding:  EdgeInsets.only(top: 15.0,bottom: 15.0),
          child:  Text("Share this generated code to other user",style:readCodeTitle,),
        ),
        Container(
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
              Center(
                child: Pinput(
                  controller: controller.pinController.value,
                  defaultPinTheme: defaultPinTheme,
                  //   focusedPinTheme: focusedPinTheme,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed:controller.copyCode, icon: Icon(Icons.copy,color: Colors.grey,)),
                  IconButton(onPressed: controller.shareCode, icon: Icon(Icons.share,color: Colors.grey,)),
                ],
              )
            ],
          ),

        ),
      ],
    );
  }
}
