import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/hooks/fetch_all_categories.dart';
import 'package:foodly/models/category.dart';
import 'category_tile.dart';

class AllCategories extends HookWidget {
  AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    final isLoading = hookResults.isLoading;
    List<CategoryModel>? allCategories = hookResults.data;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: 'Categories',
            style: appStyle(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            height: height,
            child: isLoading ? FoodsListShimmer() :  ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(allCategories!.length, (i) {
                CategoryModel category = allCategories[i];
                return CategoryTile(category: category);
              }),
            )),
      ),
    );
  }
}


