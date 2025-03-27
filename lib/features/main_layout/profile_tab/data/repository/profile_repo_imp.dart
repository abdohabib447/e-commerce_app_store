import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failuers.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_ds.dart';



@Injectable(as: ProfileRepo)
class profileRepoImp implements ProfileRepo {
  ProfileDs profileDs ;
  profileRepoImp(this.profileDs);
  @override
  Future<Either<RouteFailures, UserModel>> profileTab(ProfileModel profileModel) async{
    try{

      var data =await profileDs.profileData(profileModel);
      return right(data);
    }
    catch(e){
      return left(RouteRemoteFailures(e.toString()));
    }


  }


}