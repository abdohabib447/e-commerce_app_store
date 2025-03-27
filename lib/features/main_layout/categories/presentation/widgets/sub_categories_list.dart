
import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
   SubCategoriesList({super.key,required this.subCategories});
CategoryModel? subCategories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem("Laptops & Electronics",
                ImageAssets.categoryCardImage,goToCategoryProductsListScreen),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: subCategories?.data?.length??0,
                (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productsScreenRoute,
                    arguments: subCategories!.data?[index].catId);
                  },
                  child: SubCategoryItem(
                     subCategories?.data?[index].name?.split(" ").first??"",
                      ImageAssets.subcategoryCardImage,
                      ),
                ),
              ),
              gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: AppSize.s8,
                crossAxisSpacing: AppSize.s8,
              ))
        ],
      ),
    );
  }
   goToCategoryProductsListScreen() {
     // TODO: implement goToCategoryProductsListScreen
     throw UnimplementedError();
   }
}
