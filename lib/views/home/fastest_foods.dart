import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';

import 'package:foodly/hooks/fetch_all_foods.dart';
import 'package:foodly/models/food.dart';
import 'package:foodly/views/home/widgets/foods_tile.dart';

import '../../common/back_ground_container.dart';

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
        backgroundColor: kSecondary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kSecondary,
          title: ReusableText(text: "Fastest foods", style: appStyle(13, kGray, FontWeight.w600)),
        ),

      body: BackGroundContainer(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: isLoading ? FoodsListShimmer() :
            ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(foods!.length, (i) {
                var food = foods[i];
                return FoodsTile(food: food,);
              }),
            ),
          ),
          color: kLightWhite)
    );;
  }
}
