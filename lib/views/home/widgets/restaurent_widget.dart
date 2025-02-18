import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';

import '../../../constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.rating,
    required this.time,
    this.onTap,
  });

  final String image;
  final String logo;
  final String title;
  final String rating;
  final String time;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            height: 182.h,
            width: width * 0.75,
            // color: kSecondary,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r), color: kLightWhite),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: SizedBox(
                          height: 112.h,
                          width: width * 0.8,
                          child: Image.network(
                            image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.network(
                                  logo,
                                  fit: BoxFit.cover,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                
                Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: title, style: appStyle(12, kDark, FontWeight.w500)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(text: 'Delivery Time', style: appStyle(9, kGray, FontWeight.w500)),
                        ReusableText(text: time, style: appStyle(9, kDark, FontWeight.w500)),

                      ],
                    ),

                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) => const  Icon(
                            Icons.star,
                            color: kPrimary,
                          ),
                          itemCount: 5,
                          itemSize: 15.h,

                        ),
                         SizedBox(width: 10.w,),
                        ReusableText(text: "$rating+ Reviews & Ratings", style: appStyle(9, kDark, FontWeight.w500))
                      ],
                    )

                  ],
                ),)
                
              ],
            ),
          ),
        ));
  }
}
