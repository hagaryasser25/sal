import 'package:app_test/cubit/login/login_cubit.dart';
import 'package:app_test/screens/home/home.dart';
import 'package:app_test/shared/components/my_button.dart';
import 'package:app_test/shared/components/my_form_field.dart';
import 'package:app_test/shared/components/toast.dart';
import 'package:app_test/shared/network/cache_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login_state.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/loginPage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        if (state.loginModel.status!) {
          showToast(
            text: state.loginModel.message.toString(),
            state: ToastState.success,
          );
          CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token)
              .then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          });
        } else {
          showToast(
            text: state.loginModel.message.toString(),
            state: ToastState.error,
          );
        }
      }
    }, builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: cubit.formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'emailAddress',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyFormField(
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                        prefix: Icons.lock_outline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getDataUser(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: 'Login'),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
