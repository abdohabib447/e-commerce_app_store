
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/config/routes_manager/route_generator.dart';
import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/shared_pref.dart';
import 'core/utils/observer.dart';
import 'di.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  String? token =CacheHelper.getData<String>("token");
  configureDependencies();
  runApp(
      MainApp(loggedIn: token==null?false : true));
}

class MainApp extends StatelessWidget {
  bool loggedIn;
   MainApp({super.key,required this.loggedIn});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: !loggedIn ? Routes.signInRoute : Routes.mainRoute,
      ),
    );
  }
}
