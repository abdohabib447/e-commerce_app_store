
import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const SubCategoryItem(this.title, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: ColorManager.primary, width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: getRegularStyle(color: ColorManager.primary),
        )
      ],
    );
  }
}
