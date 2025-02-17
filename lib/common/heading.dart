import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(top: 10.h),
            child: ReusableText(text: text, style: appStyle(16, kDark, FontWeight.bold)),
          ),
          
          GestureDetector(
            onTap: onTap,
            child: Icon(AntDesign.appstore_o, color: kSecondary, size: 20.sp,),
          )
        ],
      ),
    );
    
  }
}
