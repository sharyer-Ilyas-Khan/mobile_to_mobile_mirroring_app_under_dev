import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/wifi_qr_scanner/widgets/qr_view.dart';

import '../controllers/wifi_qr_scanner_controller.dart';

class WifiQrScannerView extends GetView<WifiQrScannerController> {
  const  WifiQrScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Stack(
        children: [
          Center(
            child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: BuildQrView()),

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height*0.07,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("Assets/svg/back_ic.svg",color: Colors.black,),
                        )),
                    SizedBox(width: Get.width*0.28,),
                    Text("Wifi QR Scanner",style: infoTileHeading,),

                  ],
                ),
              ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Point your camera at the code\nto auto scan",textAlign:TextAlign.center,
                  style: oneTimePayment,
                 ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      controller.flashToggle();
                    },
                    child: Column(
                      children: [
                        Obx(() => Container(
                          height: 70,
                          width: Get.width*0.3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: controller.flashOn.value?
                            SvgPicture.asset("Assets/svg/torch_ic.svg",color: Colors.amber,):SvgPicture.asset("Assets/svg/torch_ic.svg"),
                          ),
                        )),

                        const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text("Torch"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.1,)

            ],
          ),
        ],
      ),
    );
  }
}
