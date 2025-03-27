import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_products_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';
@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductsUseCase getProductsUseCase;
  ProductBloc(this.getProductsUseCase) : super(const ProductState.initial()) {
    on<GetProductEvent>((event, emit) async {
      emit(state.copyWith(getProductState: RequestState.loading));

      var result = await getProductsUseCase(event.catId);
      result.fold(
            (l) {
          emit(state.copyWith(getProductState: RequestState.error));
        },
            (r) {
          emit(state.copyWith(
              getProductState: RequestState.success, productModel: r));
        },
      );
    });
  }
}