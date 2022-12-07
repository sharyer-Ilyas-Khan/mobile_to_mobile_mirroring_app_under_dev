import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/controllers/dialogs_controller.dart';
import '../../../data/text_styles.dart';

class CustomColorPlate extends StatelessWidget {
  final int? index;
   CustomColorPlate({this.index,Key? key}) : super(key: key);
  final List<Color?> colorsList=[
    AppColors.rainRedColor,
    AppColors.rainBlueColor,
    AppColors.rainYellowColor,
    AppColors.rainGreenColor,
    Colors.cyan,
    Colors.pink,
  ];
  int selectedIndex=2;
  @override
  Widget build(BuildContext context) {
    DialogsController controller=Get.put(DialogsController());
    return Obx(()=>
         InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        controller.checkSelectedIndex(index,colorsList[index!]);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Container(
          height: 30,
          width: 30,
          decoration: controller.selectedIndex.value==index?BoxDecoration(
              color: AppColors.colorPicker,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: colorsList[index!]!)

          ):BoxDecoration(),
          child: Center(
            child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: colorsList[index!],
                  borderRadius: BorderRadius.circular(2),

                )
            ),
          ),
        ),
      ),
    ));
  }
}
