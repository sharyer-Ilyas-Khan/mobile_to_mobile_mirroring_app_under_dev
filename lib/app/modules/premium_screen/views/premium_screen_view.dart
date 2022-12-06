import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/premium_screen/widgets/info_tile_premium.dart';
import 'package:mobile_to_mobile_mirroring_app/app/modules/premium_screen/widgets/premium_button.dart';

import '../controllers/premium_screen_controller.dart';

class PremiumScreenView extends GetView<PremiumScreenController> {
  const PremiumScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PremiumScreenController controller=Get.put(PremiumScreenController());
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 8.0,right: 8.0,top: Get.height*0.05,bottom: Get.height*0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed: (){
                  Get.back();
              }, icon: const Icon(Icons.close_rounded,color: Colors.black,)),
            ),
           SvgPicture.asset("Assets/svg/premium_top_ic.svg"),
           RichText(
               textAlign: TextAlign.center,
               text: const TextSpan(
             children:  [
               TextSpan(text: "M2M Mirroring",style: premiumHeading),
               TextSpan(text: " Plus\n",style: premiumSubHeading),
               TextSpan(text: "Get better mirroring experience",style: cardSubHeading,),
             ]
           )),
           const  InfoTilesPremium(title: "Remove annoying Ads",
              subTitle:"Remove all ads for better visual experience" ,),
            const  InfoTilesPremium(title: "Mobile sharing easily",
              subTitle:"Easy & fast access of another mobile" ,),
            const  InfoTilesPremium(title: "Remotely sharing screen",
              subTitle:"Easy & fast access of another mobile" ,),
            const  InfoTilesPremium(title: "Updated Features",
              subTitle:"Enjoy all our premium features" ,),
            const Text("Only One Time Payment",style: oneTimePayment,),
           const  PremiumButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    controller.launchUniversalLinkIos("https://sites.google.com/view/live-flight-tracker-litetc/home");
                  },
                  child: Text("Terms of services",style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "ttNor",
                      fontSize:Get.width*0.033,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5
                  ),),
                ),
                SizedBox(
                  width: Get.width*0.08,
                ),
                InkWell(
                  onTap: (){
                    controller.launchUniversalLinkIos("https://sites.google.com/view/live-flight-tracker-litepp/home");
                  },
                  child: Text("Privacy Policy",style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "ttNor",
                      fontSize: Get.width*0.033,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5
                  ),),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
