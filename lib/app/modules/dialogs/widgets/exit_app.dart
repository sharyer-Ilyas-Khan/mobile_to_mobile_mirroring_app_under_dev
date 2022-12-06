import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import '../../../data/text_styles.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height*0.2,
              width: Get.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    const Text("Are you sure you want to Quit?",style:cardHeading),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: Get.height*0.045,
                            width: Get.width*0.3,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(05.0),

                            ),
                            child: const Center(
                              child: Text(
                                "Yes",
                                style: appBarHeading,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: Get.height*0.045,
                            width: Get.width*0.3,
                            decoration: BoxDecoration(
                              color: AppColors.rainBlueColor,
                              borderRadius: BorderRadius.circular(05.0),

                            ),
                            child: const Center(
                              child: Text(
                                "No",
                                style: appBarHeading,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer()
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
