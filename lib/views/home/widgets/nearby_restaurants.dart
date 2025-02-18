import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/home/widgets/restaurent_widget.dart';

import '../../../constants/uidata.dart';
import '../../categories/category_tile.dart';

class NearByRestaurentsList extends StatelessWidget {
  const NearByRestaurentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurants.length, (i) {
            var restaurant = restaurants[i];

            return RestaurantWidget(
              image: restaurant['imageUrl'],
              logo: restaurant['logoUrl'],
              title: restaurant['title'],
              rating: restaurant['ratingCount'],
              time: restaurant['time'],
            );
          }),
        ));
  }
}
