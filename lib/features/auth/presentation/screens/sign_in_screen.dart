import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/utils/components/main_text_field.dart';
import 'package:ecommerce_app/core/utils/components/validators.dart';
import 'package:ecommerce_app/core/utils/font_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_ds_imp.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repo_imp.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signUp_usecase.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/enums.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          LoginUseCase(AuthRepoImp(AuthRemoteDsImp(ApiManager()))),
          SignUpUseCase(AuthRepoImp(AuthRemoteDsImp(ApiManager())))),
      child: BlocConsumer<AuthBloc, AuthLoginState>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainRoute, (r) => false);
          }
          if (state.requestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text(state.errorMessage ?? ""),
                    ));
          }
        },
        builder: (BuildContext context, AuthLoginState state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      BuildTextField(
                        controller: emailController,
                        backgroundColor: ColorManager.white,
                        hint: 'enter your name',
                        label: 'User name',
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                      ),
                      SizedBox(
                        height: AppSize.s28.h,
                      ),
                      BuildTextField(
                        controller: passwordController,
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            isStadiumBorder: false,
                            label: 'Login',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18),
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                  emailController.text,
                                  passwordController.text));
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context, Routes.mainRoute, (route) => false);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
