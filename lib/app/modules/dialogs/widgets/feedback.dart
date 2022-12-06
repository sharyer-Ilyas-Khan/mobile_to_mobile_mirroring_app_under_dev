import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_to_mobile_mirroring_app/app/data/colors_codes.dart';
import '../../../data/text_styles.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height*0.5,
              width: Get.width*0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.close_rounded,color: Colors.black,)),
                    ),
                    SvgPicture.asset("Assets/svg/feedback_btn_ic.svg",width: 160,),
                    const Text("Let us Know What You Think About Us.",style: readCodeTitle,),
                    Container(
                      height: Get.height*0.15,
                      width: Get.width*0.8,
                      decoration: BoxDecoration(
                          color: AppColors.feedbackColor,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow:const  [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 3,
                                offset: Offset(4,3)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          onChanged: (value){
                            // review=value;
                          },
                          // focusNode: myFocusNode,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Please write your comment here....",
                              hintStyle:codeOptions
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        // if(review==""){
                        //   showSnack("Write your review first.");
                        // }
                        // else{
                        //   feedDialogs.openFeedbackDialog(false);
                        //   functions.launchUniversalLinkIos(
                        //       "mailto:iglobecodestore.shakeelkamboh@gmail.com?subject=Live Flight Tracker Lite  FeedBack &body=$review"
                        //   );
                        // }
                      },
                      child: Container(
                        height: Get.height*0.05,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                          color: AppColors.rainBlueColor,
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                        child: const Center(
                          child: Text(
                            "SUBMIT",
                            style: appBarHeading,
                          ),
                        ),
                      ),
                    ),
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
