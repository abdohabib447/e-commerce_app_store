import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../data/models/category_model.dart';

class CustomCategoryWidget extends StatelessWidget {
  Data categoryData;

  CustomCategoryWidget({required this.categoryData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 85,
          width: 100,
          fit: BoxFit.cover,
          imageUrl: categoryData.image ?? "",
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),

        // ClipRRect(
        //   borderRadius: BorderRadius.circular(100.r),
        //   child: Container(
        //     height: 100.h,
        //     width: 100.w,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //     ),
        //     child: Image.asset(
        //       ImageAssets.categoryHomeImage,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SizedBox(height: 8.h),
        Text(
          categoryData.name ?? "",
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}