import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/cart_ds.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/cart_repo.dart';


@Injectable(as: CartRepo)
class cartRepoImp implements CartRepo{
CartDs cartDs ;
  cartRepoImp(this.cartDs);
  @override
  Future<Either<RouteFailures, CartModel>> getCardItems() async{
    try{

      var data =await cartDs.getCardItems();
      print(data);
      return right(data);
    }
    catch(e){
      print(e);
      return left(RouteRemoteFailures(e.toString()));

    }
  }

}