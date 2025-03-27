
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<CategoryBloc>()..add(GetCategoriesEvent()),
      child: BlocConsumer<CategoryBloc,CategoryState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p12),
            child: Row(
              children: [
                CategoriesList(categoryModel: state.categoryModel),
                SizedBox(
                  width: AppSize.s16,
                ),
                SubCategoriesList(subCategories: state.subcategoryModel,)
              ],
            ),
          );
        } ,


      ),
    );
  }
}
