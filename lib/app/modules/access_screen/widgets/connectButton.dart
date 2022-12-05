import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/access_screen/views/access_screen_view.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/share_screen/views/share_screen_view.dart';
class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
      },
      child: Container(
        height: 46,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0,1)

            )
          ]
        ),
        child: const Center(child: Text("Connect",style: continueButton,)),
      ),
    );
  }
}
