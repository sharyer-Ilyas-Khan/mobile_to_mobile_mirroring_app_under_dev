import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/widgets/connect_button.dart';
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
      children: [
       Padding(
         padding: const EdgeInsets.only(top: 15.0,bottom: 15.0,left: 20,right: 15),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           const   Text("Access remote device",style:readCodeTitle,),
             InkWell(
               child: SvgPicture.asset("Assets/svg/setting.svg",height: 22,),
             )
           ],
         ),
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
                child: Text("Paste access code here",style: cardHeading,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 40,),
                  Pinput(
                    controller: controller.pinController.value,
                    defaultPinTheme: defaultPinTheme,
                    onChanged: (value){
                      if(value.length<4){
                        controller.isCodeAvailable.value=false;
                      }
                    },
                    onCompleted: (value){
                      if(value.isNotEmpty && value.length==4){
                        controller.isCodeAvailable.value=true;
                      }

                    },
                    //   focusedPinTheme: focusedPinTheme,
                  ),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: controller.pasteCode,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.copy,color: Colors.black54,size: 20,),
                           Text("Paste",style:codeOptions,)
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),

        ),
        const SizedBox(height: 30,),
        const ConnectButton()

      ],
    );
  }
}
