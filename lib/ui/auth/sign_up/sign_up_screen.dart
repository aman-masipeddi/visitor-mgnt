import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:visitor_mgnt/ui/auth/sign_up/sign_up_cubit.dart';
import 'package:visitor_mgnt/ui/navigation/navigation_menu.dart';
import 'package:visitor_mgnt/utilities/ui_popups.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _contactNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: _handleLoadingAndNavigation,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Sign Up"),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    children: [
                      if (state.isLoading) const LinearProgressIndicator(),
                      const Gap.expand(100),
                      const AutoSizeText(
                        'Create an Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontStyle: FontStyle.italic),
                        maxLines: 50,
                        minFontSize: 20,
                      ),
                      const Gap.expand(100),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const Gap.expand(20),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      const Gap.expand(20),
                      TextFormField(
                        controller: _fullNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                        ),
                      ),
                      const Gap.expand(20),
                      TextFormField(
                        controller: _contactNumController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Number',
                        ),
                      ),
                      const Gap.expand(50),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: FilledButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.read<SignUpCubit>().signUp(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  fName: _fullNameController.text.trim(),
                                  phoneNum: _contactNumController.text.trim(),
                                );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
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

  _handleLoadingAndNavigation(BuildContext context, SignUpState state) {
    if (state.isFinished && state.errorMessage.isEmpty) {
      showIntermediateInfoSnackBar(context, 'Successfully created an account');
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NavigationMenu(),
          ),
        );
      });
    } else if (state.errorMessage.isNotEmpty) {
      showIntermediateErrorSnackBar(context, state.errorMessage);
    }
  }
}
