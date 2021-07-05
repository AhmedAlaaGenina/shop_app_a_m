import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_a_m/cubit/app_cubit/app_cubit.dart';
import 'package:shop_app_a_m/shared/functions/function.dart';
import 'package:shop_app_a_m/shared/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel!;
        nameController.text = userModel.data!.name!;
        emailController.text = userModel.data!.email!;
        phoneController.text = userModel.data!.phone!;
        return AppCubit.get(context).userModel != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is AppLoadingUPDataUserDataState)
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 16,
                        ),
                        BuildTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name Must not be empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BuildTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'email Must not be empty';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BuildTextFormField(
                          controller: phoneController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'phone Must not be empty';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BuildButtonLogin(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              AppCubit.get(context).upDataUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'updata',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BuildButtonLogin(
                          onTap: () {
                            signOut(context);
                          },
                          text: 'logout',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
