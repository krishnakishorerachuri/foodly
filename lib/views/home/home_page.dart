import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/custom_container.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/home/allnearby_restaurents.dart';
import 'package:foodly/views/home/recommendations.dart';
import 'package:foodly/views/home/widgets/category.dart';
import 'package:foodly/views/home/widgets/food_list.dart';
import 'package:foodly/views/home/widgets/nearby_restaurants.dart';
import 'package:get/get.dart';


import '../../common/custom_app_bar.dart';
import '../../common/heading.dart';
import 'fastest_foods.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
        appBar: PreferredSize(preferredSize: Size.fromHeight(130.h),
            child: CustomAppBar()),
        body: SafeArea(child: CustomContainer(containerContent: Column(
          children: [
            CategoryList(),
            HeadingText(text: "Nearby Restaurants", onTap: () {
              Get.to( () => AllNearByRestaurants(),
                transition: Transition.cupertino,
                duration: Duration(microseconds: 900)

              );
            },),

            NearByRestaurentsList(),

            HeadingText(text: "Try Something New", onTap: () {
              Get.to( () => AllRecommendations(),
                  transition: Transition.cupertino,
                  duration: Duration(microseconds: 900)

              );
            },),

            FoodsList(),

            HeadingText(text: "Fastest food closer to you", onTap: () {
              Get.to( () => AllFastestFoods(),
                  transition: Transition.cupertino,
                  duration: Duration(microseconds: 900)

              );
            },),

            FoodsList(),
          ],
        )))

    );
  }
}
