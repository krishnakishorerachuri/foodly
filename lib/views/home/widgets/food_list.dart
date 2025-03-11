import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_foods.dart';
import 'package:foodly/models/food.dart';

import '../../categories/category_tile.dart';
import 'food_widget.dart';

class FoodsList extends HookWidget {
  FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodModel>? foodList = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
        height: 184.h,
        child: isLoading
            ? NearbyShimmer()
            : (foodList == null || foodList.isEmpty)
                ? Center(child: Text("No food items found"))
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(foodList!.length, (i) {
                      FoodModel food = foodList[i];
                      return FoodWidget(
                        price: food.price.toStringAsFixed(2),
                        title: food.title,
                        time: food.time,
                        image: food.imageUrl[0],
                      );
                    }),
                  ));
  }
}
