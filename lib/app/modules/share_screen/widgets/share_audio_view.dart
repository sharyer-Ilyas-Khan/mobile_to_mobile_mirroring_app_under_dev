import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/controllers/share_screen_controller.dart';

class AudioTile extends StatelessWidget {
  AudioTile({Key? key}) : super(key: key);
   var toggleValue = false.obs;
  @override
  Widget build(BuildContext context) {
    ShareScreenController controller=Get.put(ShareScreenController());
    print(toggleValue.value);
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 0.5,
            offset: Offset(0,1)
          )
        ]
      ),
      child: ListTile(
        title: const Text("Audio",style: infoTileHeading,),
        subtitle: const Text("Share audio with screen",style: cardSubHeading,),
        trailing:Obx(
            ()=>Switch(
                value: controller.switchValue.value,
                onChanged: (value){
                  controller.switchValue.value=value;
                },
              activeColor: AppColors.darkBlue,
              inactiveThumbColor: Colors.black,
              // thumbColor: MaterialStateProperty.all(Colors.),
    )
        )
      ),
    );
  }
}
