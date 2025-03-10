import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_restaurants.dart';
import 'package:foodly/models/restaurant.dart';
import 'package:foodly/views/home/widgets/restaurent_widget.dart';

import '../../../constants/uidata.dart';
import '../../categories/category_tile.dart';

class NearByRestaurentsList extends HookWidget {
   NearByRestaurentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestaurantModel>? restaurantModel = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;

    return isLoading ? NearbyShimmer() : Container(
        height: 190.h,
        child:   ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurantModel!.length, (i) {
            RestaurantModel restaurant = restaurantModel[i];

            return RestaurantWidget(
              image: restaurant.imageUrl,
              logo: restaurant.logoUrl,
              title: restaurant.title,
              rating: restaurant.ratingCount,
              time: restaurant.time,
            );
          }),
        ));
  }
}
