import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/controllers/access_screen_controller.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/views/access_screen_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/views/share_screen_view.dart';
import 'package:pinput/pinput.dart';

import '../controllers/access_room_controller.dart';
class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  AccessScreenController controller=Get.put(AccessScreenController());
  AccessRoomController accessRoomController=Get.put(AccessRoomController());
    return InkWell(
      onTap:()async{
      // await accessRoomController.connectionRequest();
       accessRoomController.getAccessToken();
      },
      child: Obx(
         ()=> Container(
            height: 46,
            width: 200,
            decoration: BoxDecoration(
              color:
              (controller.pinController.value.length == 4 || controller.isCodeAvailable.value)?
              AppColors.darkBlue:Colors.grey,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0,1)

                )
              ]
            ),
            child: const Center(child: Text("Connect",style: continueButton,)),
          )

      ),
    );
  }
}
