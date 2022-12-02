import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';

import '../../../data/text_styles.dart';


class RainbowLine extends StatelessWidget {
  const RainbowLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          height: 3,
          color: AppColors.rainRedColor,
        )),
        Expanded(child: Container(
          height: 3,
          color: AppColors.rainYellowColor,
        )),
        Expanded(child: Container(
          height: 3,
          color: AppColors.rainGreenColor,
        )),
        Expanded(child: Container(
          height: 3,
          color: AppColors.rainBlueColor,
        )),
      ],
    );
  }
}
