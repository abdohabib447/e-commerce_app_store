
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key,required this.productData});
ProductData productData ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailsBloc>(),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener:  (context, state) {},
        builder: (context, state) {
          return
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Product Details',
                  style: getMediumStyle(color: ColorManager.appBarTitleColor)
                      .copyWith(fontSize: 20.sp),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: ColorManager.primary,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: ColorManager.primary,
                      )),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ProductSlider(items: [
                      ProductItem(
                        imageUrl:productData.images?[0]??""  ,
                      ),
                      ProductItem(
                        imageUrl:productData.images?[1]??""
                        ,
                      ),
                      ProductItem(
                        imageUrl:productData.images?[2]??"",
                      )
                    ], initialIndex: 0),
                    SizedBox(
                      height: 24.h,
                    ),
                    ProductLabel(
                        productName: productData.title??"", productPrice: productData.price.toString()??"0"),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductRating(
                        productBuyers:productData.sold.toString()??"0", productRating: productData.ratingsAverage.toString()??"0.0"),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductDescription(
                        productDescription:
                        productData.description??""  ),
                    ProductSize(
                      size: const [35, 38, 39, 40],
                      onSelected: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Color',
                        style: getMediumStyle(color: ColorManager.appBarTitleColor)
                            .copyWith(fontSize: 18.sp)),
                    ProductColor(color: const [
                      Colors.red,
                      Colors.blueAccent,
                      Colors.green,
                      Colors.yellow,
                    ], onSelected: () {}),
                    SizedBox(
                      height: 48.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total price',
                              style: getMediumStyle(
                                  color: ColorManager.primary.withOpacity(.6))
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text('${productData.price}',
                                style:
                                getMediumStyle(color: ColorManager.appBarTitleColor)
                                    .copyWith(fontSize: 18.sp))
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Add to cart',
                            onTap: () {BlocProvider.of<ProductDetailsBloc>(context).add(AddToCartEvent(productData.id??""));},
                            prefixIcon: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: ColorManager.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            );
        },



      ),
    );
  }
}
