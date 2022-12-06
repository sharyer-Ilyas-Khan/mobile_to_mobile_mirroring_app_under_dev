import 'package:flutter/material.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:get/get.dart';


class PremiumButton extends StatelessWidget {
  const PremiumButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
      width: Get.width*0.7,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.0),

      ),
        child: const Center(
          child: Text("CONTINUE",style: continueButton,),
        ),
      ),
    );
  }
}
