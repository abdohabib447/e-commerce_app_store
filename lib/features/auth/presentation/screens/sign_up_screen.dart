
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/components/main_text_field.dart';
import 'package:ecommerce_app/core/utils/components/validators.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repo_imp.dart';
import 'package:ecommerce_app/features/auth/domain/entity/signUp_entity.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/components/custom_elevated_button.dart';
import '../../data/data_source/remote/auth_remote_ds_imp.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          LoginUseCase(AuthRepoImp(AuthRemoteDsImp(ApiManager()))),
          SignUpUseCase(AuthRepoImp(AuthRemoteDsImp(ApiManager())))),
      child: BlocConsumer<AuthBloc,AuthLoginState>(
        listener: ( context,  state) {
          if(state.requestState == RequestState.success){
            Navigator.pushNamed(context, Routes.signInRoute,
            );
          }
          else if(state.requestState == RequestState.error){
            print("error");
          }

        },
        builder: (BuildContext context, state) {return
          Scaffold(
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
                      BuildTextField(
                        controller: nameController,
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: phoneController,
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: emailController,
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                       controller: passwordController,
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Sign Up',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary, fontSize: AppSize.s20),
                            onTap: () {
                              SignupEntity entity= SignupEntity(
                                  fullName: nameController.text,
                                  Phone: phoneController.text,
                                  email: emailController.text,
                                  Password: passwordController.text
                              );
                              BlocProvider.of<AuthBloc>(context).add(SignUpEvent(entity));

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );},


      ),
    );
  }
}
