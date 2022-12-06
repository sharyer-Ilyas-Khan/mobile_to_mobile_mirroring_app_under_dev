import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../data/text_styles.dart';

class OptionTilesForSetting extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  const OptionTilesForSetting({this.title,this.svgIcon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children:  [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("Assets/svg/$svgIcon.svg",height: 15,),
            ),
            title: Text(title!,style: settingOptions,),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 14,),

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
    );
  }
}
