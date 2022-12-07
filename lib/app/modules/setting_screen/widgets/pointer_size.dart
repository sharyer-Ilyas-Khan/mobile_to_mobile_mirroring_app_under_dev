import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/controllers/dialogs_controller.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/controllers/setting_screen_controller.dart';
import '../../../data/text_styles.dart';

class PointerSize extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  const PointerSize({this.title,this.svgIcon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingScreenController controller=Get.put(SettingScreenController());
    DialogsController dialogController=Get.put(DialogsController());
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (){
        controller.openPointerDialog();
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
              trailing: Obx(()=>
              controller.openPointerSize.value?
              const Icon(Icons.keyboard_arrow_down_outlined,size: 25,):
              const Icon(Icons.arrow_forward_ios_rounded,size: 14,)),

            ),
            Obx(
              ()=> controller.openPointerSize.value?
              SizedBox(
                height: 50,
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SizedBox(
                      width: Get.width*0.7,
                      child:Obx(()=>Slider(
                        min: 0,
                        max: 10,
                        value: controller.sliderValue.value,
                        thumbColor: Colors.black,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black38,
                        onChanged: (value){
                          controller.sliderOnChange(value);

                        },),)
                    ),
                  Obx(() => Container(
                      height: controller.sliderValue.value+25,
                      width: controller.sliderValue.value+25,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: dialogController.pointerColor.value
                      )))


                  ],
                ),
              ),
              ):Container(),
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
