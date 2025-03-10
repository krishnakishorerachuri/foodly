import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/hooks/fetch_categories.dart';
import '../../../common/shimmers/categories_shimmer.dart';
import '../../../models/category.dart';
import 'CategoryWidget.dart';

class CategoryList extends HookWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
   final hookResults = useFetchCategories();
    List<CategoryModel>? categoryResults = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading ? const  CategoriesShimmer() : ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categoryResults!.length, (i) {
          CategoryModel category = categoryResults[i];
          return CategoryWidget( category: category);
        }),
      ),
    );
  }
}


