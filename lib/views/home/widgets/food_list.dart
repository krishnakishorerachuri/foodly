import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';

import '../../../constants/uidata.dart';
import '../../categories/category_tile.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(foods.length, (i) {
            var restaurent = foods[i];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200.h,
                width: 159.w,
                color: kSecondary,
              ),
            );
          }),
        ));
  }
}
