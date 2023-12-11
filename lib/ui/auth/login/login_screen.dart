import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:visitor_mgnt/ui/auth/login/log_in_cubit.dart';
import 'package:visitor_mgnt/ui/auth/sign_up/sign_up_screen.dart';

import 'package:visitor_mgnt/ui/navigation/navigation_menu.dart';
import 'package:visitor_mgnt/utilities/ui_popups.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogInCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log In"),
        ),
        body: BlocConsumer<LogInCubit, LogInState>(
          listener: _handleLoadingAndNavigation,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (state.isLoading) const LinearProgressIndicator(),
                  const Padding(
                    padding: EdgeInsets.only(top: 100.0),
                  ),
                  const AutoSizeText(
                    'WELCOME!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontStyle: FontStyle.italic),
                    maxLines: 50,
                    minFontSize: 20,
                  ),
                  const Gap(100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  const Gap(30),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: FilledButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<LogInCubit>().onLogIn(
                              emailID: _emailController.text,
                              password: _passwordController.text,
                            );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _handleLoadingAndNavigation(BuildContext context, LogInState state) {
    if (state.isLoading) {
    } else if (state.isFinished && state.errorMessage.isEmpty) {
      showIntermediateInfoSnackBar(context, 'Successfully authenticated user!');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavigationMenu(),
        ),
      );
    } else if (state.errorMessage.isNotEmpty) {
      showIntermediateErrorSnackBar(context, state.errorMessage);
    }
  }
}
