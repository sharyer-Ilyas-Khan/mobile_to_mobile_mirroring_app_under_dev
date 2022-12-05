import 'package:flutter/material.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:get/get.dart';
class InfoTiles extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const InfoTiles({this.title,this.subTitle,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 0.0),
      child: SizedBox(
        width: Get.width*0.9,
        height: Get.height*0.06,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(Icons.circle,color: AppColors.primaryColor,size: 10,),
            const Spacer(),
            SizedBox(
              width: Get.width*0.8,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(title!,style:infoTileHeading ,) ,
                subtitle:Text(subTitle!,style: cardSubHeading,),
              ),
            )

          ],
        ),
      ),
    );
  }
}
