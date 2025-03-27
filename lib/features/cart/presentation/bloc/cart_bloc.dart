import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/cart_use_case.dart';
part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartUseCase cartUseCase;
  CartBloc(this.cartUseCase) : super(const CartState.initial()) {
    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(getCartItemsState: RequestState.loading));
      var result = await cartUseCase();
      result.fold(
        (l) {
          emit(state.copyWith(getCartItemsState: RequestState.error));
          print(l);
        },
        (r) {
          emit(state.copyWith(
              getCartItemsState: RequestState.success, cartModel: r));
          print("r--------------$r");
        },
      );
    });
  }
}
