import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
class WifiQrScanner extends StatelessWidget {
  const WifiQrScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
        Container(
          height: 100,
          color: Colors.white,
        ),

          //Title bar
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: Get.width/1.2,
            // height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 12.0,top: 15.0,bottom: 15.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 4,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const  [
                      Text("WIFI QR SCANNER.",style: wifiButtonHeading,),
                      Text("One Tap to scan",style: wifiButtonSubHeading,),
                    ],
                  ),
                ),

              ),
            ),
          ),
          //Circle with qr icon
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            width: 100,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle
                  ),
                  child:  Center(
                    child: SvgPicture.asset("Assets/svg/qr.svg"),
                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
