import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';

import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget {

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h ,
      color: kOffWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 23.r,
                backgroundColor: kSecondary,

              ),

              Padding(
                padding:  EdgeInsets.only(left: 8.w, bottom: 6.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: "Delivery to", style: appStyle(13, kSecondary, FontWeight.w600),),
                    SizedBox(
                      width: width * 0.65,
                        child: Text("16766 Ave Plymouth, MN 55447",
                          style: appStyle(11, kGrayLight, FontWeight.normal),
                          overflow: TextOverflow.ellipsis,)),

                  ],
                ),
              ),

            ],
          ),
          Text(getTimeOfTheDay(), style: const TextStyle(fontSize: 35),)
        ],
      )

    );
  }

  String getTimeOfTheDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if(hour >= 0 && hour < 12) {
      return ' 🥱';
    }else if(hour >= 12 && hour < 16 ) {
      return ' 😧';
    }else {
      return ' 😭';
    }
  }
}
