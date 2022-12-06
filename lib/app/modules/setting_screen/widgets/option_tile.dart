import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/views/dialogs_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/dialogs/widgets/feedback.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/setting_screen/controllers/setting_screen_controller.dart';
import '../../../data/text_styles.dart';

class OptionTilesForSetting extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  final String? tag;
  const OptionTilesForSetting({this.tag,this.title,this.svgIcon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingScreenController controller=Get.put(SettingScreenController());
    return InkWell(
      onTap: (){
        controller.openDialog(tag);
      },
      child: Padding(
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
      ),
    );
  }
}
