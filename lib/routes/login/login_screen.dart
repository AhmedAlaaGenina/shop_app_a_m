import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/cubit/login_cubit/login_cubit.dart';
import 'package:shop_app_a_m/data/local/cash_helper.dart';
import 'package:shop_app_a_m/routes/register/register_screen.dart';
import 'package:shop_app_a_m/shared/constants/constants.dart';
import 'package:shop_app_a_m/shared/enums/help_data_enum.dart';
import 'package:shop_app_a_m/shared/enums/toast_enum.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

import '../home_page.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              token = state.loginModel.data!.token!;
              CashHelper.setData(
                key: HelpDataEnum.Token.toString(),
                value: state.loginModel.data!.token,
              ).then((value) {
                BlocProvider.of<AppCubit>(context).getFavoritesData();
                context.read<AppCubit>().getUserData();
                navigateAndFinish(context, HomePage());
              });
              showToast(
                text: state.loginModel.message,
                state: ToastStateEnum.SUCCESS,
              );
            } else {
              print(state.loginModel.message);
              showToast(
                text: state.loginModel.message,
                state: ToastStateEnum.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          var loginCubit = LoginCubit.get(context);
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
                          'LOGIN',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'login now to browse our new offers',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.grey,
                                  ),
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
                          onSubmit: (_) {
                            if (formKey.currentState!.validate()) {
                              loginCubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: loginCubit.isPassword,
                          suffixPressed: () {
                            loginCubit.changePasswordVisibility();
                          },
                          prefix: Icons.lock_outline,
                          suffix: loginCubit.suffix,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        state is! LoginLoadingState
                            ? BuildButtonLogin(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    loginCubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: "Login",
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t Have Account ?!"),
                            TextButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              child: Text("Register Now!".toUpperCase()),
                            ),
                          ],
                        )
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
