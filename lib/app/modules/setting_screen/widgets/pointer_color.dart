import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/controllers/dialogs_controller.dart';
import '../../../data/text_styles.dart';
import '../controllers/setting_screen_controller.dart';

class PointerColor extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  const PointerColor({this.title,this.svgIcon,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SettingScreenController controller=Get.put(SettingScreenController());
    DialogsController dialogController=Get.put(DialogsController());
    return InkWell(
      onTap: (){
        controller.openColorPicker();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children:  [
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("Assets/svg/$svgIcon.svg",height: 18,),
              ),
              title: Text(title!,style: settingOptions,),

              trailing: Obx(() => Container(
                height: 35,width: 35,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: dialogController.pointerColor.value,
                    border: Border.all(width: 5,color: Colors.white),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 4
                      )
                    ]
                ),
              ),)

            ),
            const Padding(
              padding:  EdgeInsets.only(left: 12.0,right: 12.0),
              child: Divider(
                height: 2,
                thickness: 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
