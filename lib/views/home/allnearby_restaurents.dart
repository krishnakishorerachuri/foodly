import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import 'package:foodly/models/restaurant.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';
import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import '../../constants/uidata.dart';
import '../../hooks/fetch_all_restaurants.dart';

class AllNearByRestaurants extends HookWidget {
   AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantModel>? allRestaurents = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;
    return Scaffold(

        backgroundColor: kSecondary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kSecondary,
          title: ReusableText(text: "All Nearby Restaurants", style: appStyle(13, kGray, FontWeight.w600)),
        ),

      body: BackGroundContainer(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: isLoading ? FoodsListShimmer() :  ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(allRestaurents!.length, (i) {
                RestaurantModel restaurant = allRestaurents[i];
                return RestaurantTile(restaurant: restaurant,);
              }),
            ),
          ),
          color: kLightWhite)
    );
  }
}
