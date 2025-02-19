import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';

import '../../../constants/uidata.dart';
import '../../categories/category_tile.dart';
import 'food_widget.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 184.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(foods.length, (i) {
            var food = foods[i];
            return FoodWidget(price: food['price'].toStringAsFixed(2), title: food['title'], time: food['time'], image: food['imageUrl'], );
          }),
        )
    );
  }
}
