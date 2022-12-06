import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/controllers/dialogs_controller.dart';
import '../../../data/text_styles.dart';


class ColorPickerDiloge extends StatelessWidget {
  const ColorPickerDiloge({Key? key}) : super(key: key);

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                shadowColor: Colors.transparent,
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
                      child:  Text("Custom colors",style: readCodeTitle,),
                    ),
                    ColorPicker(
                      pickerAreaHeightPercent: 0.7,
                        hexInputBar: false,
                        portraitOnly: true,
                        pickerColor: controller.pointerColor.value,
                        onColorChanged:controller.changeColor
                    ),


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
