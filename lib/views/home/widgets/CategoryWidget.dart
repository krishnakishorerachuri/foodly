

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/views/categories/all_categories.dart';
import 'package:get/get.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../controllers/categories_controller.dart';
import '../../../models/category.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({
    super.key,

    required this.category,
  });

   CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {

            controller.updateCategory = '';
            controller.updateTitle = '';
          } else if (category.title == 'More') {
            Get.to(() => AllCategories(),
                transition: Transition.fadeIn,
                duration: Duration(microseconds: 900));
          } else {

            controller.updateCategory = category.id;
            controller.updateTitle = category.title;
          }
        },
        child: Obx( () =>
            Container(
              margin: EdgeInsets.only(
                right: 5.w,
              ),
              padding: EdgeInsets.only(top: 5.h),
              width: width * 0.19,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: controller.categoryValue == category.id ?  kSecondary: kOffWhite, width: 1.w)),
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Image.network(
                      category.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  ReusableText(
                      text: category.title,
                      style: appStyle(12, kDark, FontWeight.normal))
                ],
              ),
            ),


        )
    );
  }
}