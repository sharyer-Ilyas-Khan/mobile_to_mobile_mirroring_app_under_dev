import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/controllers/dialogs_controller.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/widgets/custom_color_pate.dart';
import '../../../data/text_styles.dart';


class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogsController controller=Get.put(DialogsController());
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height*0.7,
              width: Get.width*0.85,
              decoration: BoxDecoration(
                color: AppColors.colorPicker,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: AppColors.colorPicker,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.close_rounded,color: Colors.black,)),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 22.0,bottom: 10.0),
                      child:  Text("Select color",style: readCodeTitle,),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          itemCount: 6,
                          padding: const EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index){
                        return  CustomColorPlate(index:index);
                      }),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 22.0,bottom: 10.0),
                      child:  Text("Custom color",style: readCodeTitle,),
                    ),
                    Obx(() => ColorPicker(
                      pickerAreaHeightPercent: 0.7,
                      hexInputBar: false,
                      portraitOnly: true,
                      pickerColor: controller.pointerColor.value,
                      onColorChanged:controller.changeColor,

                    ),),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.darkBlue),
                        ),
                          onPressed: (){
                        Get.back();
                      }, child: const Text("Done")),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
