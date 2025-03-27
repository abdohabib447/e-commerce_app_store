import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/product_repo.dart';
import '../data_sources/product_details_ds.dart';

@Injectable(as: ProductDetailsRepo)
class ProductRepoImp implements ProductDetailsRepo{
  ProductDetailsDs productDetailsDs;
  ProductRepoImp(this.productDetailsDs);
  @override
  Future<Either<RouteFailures, AddToCartModel>> addToCart(String prodId) async{
try{

  var data =await productDetailsDs.addToCart( prodId);
  return right(data);
}
    catch(e){
  return left(RouteRemoteFailures(e.toString()));
    }
  }

}