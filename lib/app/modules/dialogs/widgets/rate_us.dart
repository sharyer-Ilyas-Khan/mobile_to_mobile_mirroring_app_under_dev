
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import '../../../data/text_styles.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RateUsDialog extends StatelessWidget {
  const RateUsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height*0.4,
              width: Get.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){
                       Get.back();
                      }, icon: Icon(Icons.close_rounded,color: Colors.black,)),
                    ),
                    SvgPicture.asset("Assets/svg/rate_us_illustration_ic.svg",width: 200,),
                    const Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.1,),
                      child: const Text("Let Others Know What You Think About This App",
                          textAlign: TextAlign.center,
                        style: readCodeTitle),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    RatingBar(
                      initialRating: 0,
                      glowColor: Colors.amber,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,

                      ratingWidget: RatingWidget(
                        full: Padding(
                          padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child: SvgPicture.asset("Assets/svg/filled_star_ic.svg",height:40,width: 10,),
                        ),
                        half:  Padding(
                          padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child: SvgPicture.asset("Assets/svg/half_filled_star_ic.svg",height: 30,width: 10,),
                        ),
                        empty:  Padding(
                          padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child: SvgPicture.asset("Assets/svg/unfilled_star_ic.svg",height: 30,width: 10,),
                        ),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      onRatingUpdate: (rating) {
                      //   newRating=rating;
                      //   if(feedDialogs.text=="exit" && rating<4 && rating>0){
                      //     showSnack("Thanks for rating our app");
                      //     feedDialogs.openRateUsDialog(false);
                      //   }
                      //   if(feedDialogs.text=="exit" && rating>=4){
                      //     feedDialogs.openRateUsDialog(false);
                      //     rateReviewApp();
                      //   }
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){

                        // if(newRating<4&&newRating>0 && feedDialogs.text!="exit" ){
                        //   feedDialogs.openRateUsDialog(false);
                        //   showSnack("Thanks for rating our app");
                        // }
                        // if(newRating>=4 && feedDialogs.text!="exit"){
                        //   feedDialogs.openRateUsDialog(false);
                        //   rateReviewApp();
                        // }
                        // if(newRating==0&& feedDialogs.text!="exit"){
                        //   showSnack("please select stars first");
                        // }
                        // if(feedDialogs.text=="exit"){
                        //   feedDialogs.openRateUsDialog(false);
                        // }
                      },
                      child: Container(
                        height: Get.height*0.05,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                          color: AppColors.rainBlueColor,
                          borderRadius: BorderRadius.circular(05.0),

                        ),
                        child: const Center(
                          child: Text(
                            "SUBMIT",
                            style: appBarHeading,
                          ),
                        ),
                      ),
                    ),
                    const  Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



