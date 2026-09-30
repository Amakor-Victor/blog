import 'package:blog/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/app/shared/widgets/custom_wide_button.dart';
import 'package:blog/app/shared/widgets/custom_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  bool rememberUser = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFFFFFFF),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/dashboard');
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 36.0,
                horizontal: 16.0,
              ),
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: .circular(12),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(0, 4),
                        spreadRadius: -4,
                        blurRadius: 6,
                      ),
                      const BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(0, 10),
                        spreadRadius: -3,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 800
                          ? 800
                          : double.infinity,
                      height: 680,
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .center,
                        children: [
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0XFF6063EE),
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              height: 48,
                              width: 48,
                              child: Icon(Icons.book, color: Colors.white),
                            ),
                          ),
                          const Text(
                            'Welcome Back',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            'Please enter your details to sign in',
                            style: TextStyle(fontSize: 16),
                          ),
                          CustomFormField(
                            controller: _emailController,
                            placeholder: 'Email address',
                          ),
                          CustomFormField(
                            obscureText: obscureText,
                            controller: _passwordController,
                            placeholder: 'password',
                            trailingIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: obscureText
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Color(0x80464554),
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Color(0x80464554),
                                    ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberUser,
                                    onChanged: (t) {
                                      setState(() {
                                        rememberUser = !rememberUser;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),

                              const Text(
                                overflow: TextOverflow.ellipsis,
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF4648D4),
                                ),
                              ),
                            ],
                          ),
                          CustomWideButton(
                            backgroundColor: const Color(0XFF6063EE),
                            ontap: () {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('required field is empty'),
                                  ),
                                );
                              } else {
                                context.read<AuthBloc>().add(
                                  RequestLogin(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                            child: state is AuthLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 5,
                                    ),
                                  )
                                : const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),

                          const Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(fontSize: 16),
                          ),
                          CustomWideButton(
                            ontap: () {},
                            backgroundColor: Colors.white,
                            child: const Row(
                              mainAxisAlignment: .center,
                              children: [
                                Icon(Icons.apple, color: Color(0xFF4648D4)),
                                Text('  Apple'),
                              ],
                            ),
                          ),
                          CustomWideButton(
                            ontap: () {},
                            backgroundColor: Colors.white,
                            child: const Row(
                              mainAxisAlignment: .center,
                              children: [
                                Icon(Icons.facebook, color: Color(0xFF4648D4)),
                                Text('  Facebook'),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              const Text(
                                'Don\'t have an account?  ',
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Color(0xFF4648D4),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
