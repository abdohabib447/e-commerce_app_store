import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_model.dart';
import 'package:ecommerce_app/features/product_details/domain/use_cases/addProductsUseCase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';
@injectable
class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  AddProductsUseCase addProductsUseCase;
  ProductDetailsBloc(this.addProductsUseCase) : super(const ProductDetailsState.initial()) {
    on<AddToCartEvent>((event, emit) async{
emit(state.copyWith(addToCartState: RequestState.loading));

var result = await addProductsUseCase(event.prodId);
result.fold((l) {
emit(state.copyWith(addToCartState:RequestState.error));
}, (r) {
  emit(state.copyWith(addToCartState:RequestState.success));
},);
    });
  }
}
