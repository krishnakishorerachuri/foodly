import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/views/home/widgets/foods_tile.dart';

import '../../common/app_style.dart';
import '../../common/back_ground_container.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import '../../constants/uidata.dart';

class AllRecommendations extends StatelessWidget {
  const AllRecommendations({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Recommendations", style: appStyle(13, kGray, FontWeight.w600)),
      ),

      body: BackGroundContainer(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(foods.length, (i) {
                var food = foods[i];
                return FoodsTile(food: food,);
              }),
            ),
          ),
          color: Colors.white)
    );;;
  }
}
