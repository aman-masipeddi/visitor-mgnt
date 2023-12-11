import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:visitor_mgnt/ui/auth/login/login_screen.dart';
import 'package:visitor_mgnt/ui/bootstrap/initial/initial_cubit.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';
import 'package:visitor_mgnt/utilities/ui_popups.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InitScreenCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Visitor Management',
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<InitScreenCubit, InitScreenState>(
              listener: _handleLoadingAndNavigation,
              builder: (context, state) {
                if (state.isLoading) {
                  return const LinearProgressIndicator(
                    semanticsLabel: 'Linear progress indicator',
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.30,
                          child: const Center(
                            child: AutoSizeText(
                              'Welcome!',
                              minFontSize: 30,
                              maxFontSize: 60,
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        const AutoSizeText(
                          'Please identify yourself:',
                          minFontSize: 20,
                          maxFontSize: 40,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const Gap(30),
                        FilledButton(
                          onPressed: () {
                            context.read<InitScreenCubit>().logInExtUser();
                          },
                          child: const Text(
                            'External User',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        const Gap(30),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Admin',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
          ),
        ),
      ),
    );
  }

  _handleLoadingAndNavigation(BuildContext context, InitScreenState state) {

    if (state.isSuccess && state.errorMessage.isEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const UserSessionScreen(),
        ),
      );
    } else if (state.errorMessage.isNotEmpty) {
      showIntermediateErrorSnackBar(context, state.errorMessage);
    }
  }
}
