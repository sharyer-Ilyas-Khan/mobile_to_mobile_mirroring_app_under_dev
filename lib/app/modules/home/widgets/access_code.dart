import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/info_screen/views/info_screen_view.dart';

import '../../../data/text_styles.dart';
import '../views/home_view.dart';

class AccessCode extends StatelessWidget {
  const AccessCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 8.0,bottom: 8.0),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 4
              )
            ]
        ),
        child: Stack(
          children:  [
            Container(
              height:Get.height*0.12 ,
              width: Get.width*0.92,
              decoration: const BoxDecoration(
                  image: DecorationImage(image:AssetImage("Assets/images/access_bg_img.png"),
                      fit: BoxFit.fill)
              ),
              child: Center(
                child: SvgPicture.asset("Assets/svg/rs_phone_ic.svg"),
              ),
            ),
            Positioned(
                height: 40,
                left: 0,
                top: 0,
                child: Transform.rotate(
                    angle: -3.9,
                    child: Lottie.asset("Assets/lottie/wifi.json"))),
            InkWell(
              onTap: goToInfoScreen,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                     Text("Remote screen",style: cardHeading,),
                     SizedBox(height: 2,),
                     Text("Paste code here to access the shared person device in your mobile screen.",style: cardSubHeading,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child:  Text(
                          "Access code  >>",
                          style:cardButtonText ,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void goToInfoScreen(){
    Get.to(const InfoScreenView(tag: "access",));
  }
}
