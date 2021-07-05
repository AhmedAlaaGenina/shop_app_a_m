import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/cubit/login_cubit/login_cubit.dart';
import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';
import 'package:shop_app_a_m/shared/enums/toast_enum.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

import '../home_page.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.register.status) {
              print(state.register.message);
              print(state.register.data!.token);
              token = state.register.data!.token!;
              CashHelper.setData(
                key: HelpDataEnum.Token.toString(),
                value: state.register.data!.token,
              ).then((value) {
                BlocProvider.of<AppCubit>(context).getFavoritesData();
                context.read<AppCubit>().getUserData();
                navigateAndFinish(context, HomePage());
              });
              showToast(
                text: state.register.message,
                state: ToastStateEnum.SUCCESS,
              );
            } else {
              print(state.register.message);
              showToast(
                text: state.register.message,
                state: ToastStateEnum.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Register now to browse our new offers',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BuildTextFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BuildTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'email must not be empty';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BuildTextFormField(
                          controller: passwordController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          label: 'Password',
                          isPassword: cubit.isPassword,
                          suffixPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BuildTextFormField(
                          controller: phoneController,
                          type: TextInputType.number,
                          onSubmit: (_) {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                name: nameController.text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Phone must not be empty';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        state is! RegisterLoadingState
                            ? BuildButtonLogin(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      name: nameController.text,
                                    );
                                  }
                                },
                                text: "rgister",
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
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
