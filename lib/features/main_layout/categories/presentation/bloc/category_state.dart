part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial({
  @Default(RequestState.init)  RequestState getCategoriesState,
    @Default(RequestState.init)  RequestState getSubCategoriesState,
    CategoryModel? categoryModel,
    CategoryModel? subcategoryModel,
    String? errorMessage,}
) = _Initial;
}
