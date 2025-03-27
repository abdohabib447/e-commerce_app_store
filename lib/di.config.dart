// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/cart/data/data_sources/cart_ds.dart' as _i21;
import 'features/cart/data/data_sources/cart_DsImp.dart' as _i655;
import 'features/cart/data/repositories/cart_repo_imp.dart' as _i693;
import 'features/cart/domain/repositories/cart_repo.dart' as _i361;
import 'features/cart/domain/use_cases/cart_use_case.dart' as _i129;
import 'features/cart/presentation/bloc/cart_bloc.dart' as _i239;
import 'features/main_layout/categories/data/data_sources/category_ds.dart'
    as _i847;
import 'features/main_layout/categories/data/data_sources/category_ds_imp.dart'
    as _i198;
import 'features/main_layout/categories/data/repositories/category_repo_imp.dart'
    as _i667;
import 'features/main_layout/categories/domain/repositories/category_repo.dart'
    as _i94;
import 'features/main_layout/categories/domain/use_cases/get_sub_categories.dart'
    as _i62;
import 'features/main_layout/categories/presentation/bloc/category_bloc.dart'
    as _i916;
import 'features/main_layout/home/data/dataSource/category_ds.dart' as _i564;
import 'features/main_layout/home/data/dataSource/category_ds_imp.dart'
    as _i397;
import 'features/main_layout/home/data/repository/category_repo_impl.dart'
    as _i555;
import 'features/main_layout/home/domain/repository/category_repo.dart'
    as _i288;
import 'features/main_layout/home/domain/usecases/get_category_usecases.dart'
    as _i554;
import 'features/main_layout/home/presentation/bloc/category_bloc.dart'
    as _i334;
import 'features/main_layout/profile_tab/data/data_source/profile_ds.dart'
    as _i664;
import 'features/main_layout/profile_tab/data/data_source/profile_ds_imp.dart'
    as _i581;
import 'features/main_layout/profile_tab/data/repository/profile_repo_imp.dart'
    as _i521;
import 'features/main_layout/profile_tab/domain/repository/profile_repo.dart'
    as _i439;
import 'features/main_layout/profile_tab/domain/use_case/profile_usecase.dart'
    as _i287;
import 'features/main_layout/profile_tab/presentation/bloc/profile_bloc.dart'
    as _i893;
import 'features/product_details/data/data_sources/product_details_ds.dart'
    as _i122;
import 'features/product_details/data/data_sources/Products_details_DsImp.dart'
    as _i209;
import 'features/product_details/data/repositories/product_details_repo_imp.dart'
    as _i94;
import 'features/product_details/domain/repositories/product_repo.dart' as _i63;
import 'features/product_details/domain/use_cases/addProductsUseCase.dart'
    as _i858;
import 'features/product_details/presentation/bloc/product_details_bloc.dart'
    as _i466;
import 'features/products_screen/data/data_sources/product_ds.dart' as _i941;
import 'features/products_screen/data/data_sources/ProductsDsImp.dart' as _i767;
import 'features/products_screen/data/repositories/product_repo_imp.dart'
    as _i788;
import 'features/products_screen/domain/repositories/product_repo.dart'
    as _i948;
import 'features/products_screen/domain/use_cases/get_products_use_case.dart'
    as _i517;
import 'features/products_screen/presentation/bloc/product_bloc.dart' as _i477;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i847.CategoryDs>(() => _i198.CategoryDsImp());
    gh.factory<_i94.CategoryRepo>(
        () => _i667.CategoryRepoImp(gh<_i847.CategoryDs>()));
    gh.factory<_i122.ProductDetailsDs>(() => _i209.ProductsDetailsDsImp());
    gh.factory<_i564.CategoryDS>(() => _i397.CategoryDSImpl());
    gh.factory<_i62.GetSubCategoryUseCase>(
        () => _i62.GetSubCategoryUseCase(gh<_i94.CategoryRepo>()));
    gh.factory<_i21.CartDs>(() => _i655.cartsDsImpl());
    gh.factory<_i941.ProductDs>(() => _i767.ProductsDsImp());
    gh.factory<_i63.ProductDetailsRepo>(
        () => _i94.ProductRepoImp(gh<_i122.ProductDetailsDs>()));
    gh.factory<_i948.ProductRepo>(
        () => _i788.ProductRepoImp(gh<_i941.ProductDs>()));
    gh.factory<_i517.GetProductsUseCase>(
        () => _i517.GetProductsUseCase(gh<_i948.ProductRepo>()));
    gh.factory<_i361.CartRepo>(() => _i693.cartRepoImp(gh<_i21.CartDs>()));
    gh.factory<_i129.CartUseCase>(
        () => _i129.CartUseCase(gh<_i361.CartRepo>()));
    gh.factory<_i477.ProductBloc>(
        () => _i477.ProductBloc(gh<_i517.GetProductsUseCase>()));
    gh.factory<_i664.ProfileDs>(
        () => _i581.ProfileDsImp(gh<_i237.ApiManager>()));
    gh.factory<_i239.CartBloc>(() => _i239.CartBloc(gh<_i129.CartUseCase>()));
    gh.factory<_i288.CategoryRepository>(
        () => _i555.CategoryRepoImpl(gh<_i564.CategoryDS>()));
    gh.factory<_i858.AddProductsUseCase>(
        () => _i858.AddProductsUseCase(gh<_i63.ProductDetailsRepo>()));
    gh.factory<_i466.ProductDetailsBloc>(
        () => _i466.ProductDetailsBloc(gh<_i858.AddProductsUseCase>()));
    gh.factory<_i554.GetCategoryUseCase>(
        () => _i554.GetCategoryUseCase(gh<_i288.CategoryRepository>()));
    gh.factory<_i916.CategoryBloc>(() => _i916.CategoryBloc(
          gh<_i554.GetCategoryUseCase>(),
          gh<_i62.GetSubCategoryUseCase>(),
        ));
    gh.factory<_i439.ProfileRepo>(
        () => _i521.profileRepoImp(gh<_i664.ProfileDs>()));
    gh.factory<_i334.HomeBloc>(
        () => _i334.HomeBloc(gh<_i554.GetCategoryUseCase>()));
    gh.factory<_i287.ProfileUseCase>(
        () => _i287.ProfileUseCase(gh<_i439.ProfileRepo>()));
    gh.factory<_i893.ProfileBloc>(
        () => _i893.ProfileBloc(gh<_i287.ProfileUseCase>()));
    return this;
  }
}
