import 'package:coureses_platform/core/functions.dart';
import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/core/widgets/custom_button.dart';
import 'package:coureses_platform/core/widgets/custom_text_form_feild.dart';
import 'package:coureses_platform/core/widgets/textwidget.dart' show TextWidget;
import 'package:coureses_platform/core/widgets/topscreenwidget.dart';
import 'package:coureses_platform/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:coureses_platform/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:coureses_platform/features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:coureses_platform/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthCubit(AuthRepo());
      },
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            snackBarMessage(context: context, text: state.errmsg);
          }
          if (state is LoginSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homescreen,
              (_) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: loginformKey,
                child: Column(
                  children: [
                    TopScreen(text: 'Login'),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          TextWidget(text: 'Email'),
                          SizedBox(height: 12),
                          CustomTextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (!value!.contains('@')) {
                                return 'Invalid Email';
                              }
                              if (value.isEmpty) {
                                return 'Inter your email';
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.email),
                            label: Text('Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          TextWidget(text: 'Password'),
                          SizedBox(height: 12),
                          CustomTextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Please enter a strong password';
                              }
                              if (value.isEmpty) {
                                return 'Inter your password';
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.lock),
                            label: Text('Password'),
                            obscureText: true,
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text('Forget Password?'),
                          ),
                          SizedBox(height: 20),
                          state is LoginLoadingState
                              ? CircularProgressIndicator()
                              : CustomButton(
                                  text: 'Login',
                                  onPressed: () {
                                    if (loginformKey.currentState!.validate()) {
                                      context.read<AuthCubit>().signin(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      );
                                    }
                                  },
                                ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signupscreen);
                            },
                            child: Text('SignUp'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
