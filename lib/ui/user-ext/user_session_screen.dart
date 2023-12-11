import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:visitor_mgnt/ui/auth/login/login_screen.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_cubit.dart';

import 'package:visitor_mgnt/utilities/ui_popups.dart';
import 'package:visitor_mgnt/utilities/utilities.dart';


class UserSessionScreen extends StatefulWidget {
  const UserSessionScreen({super.key});

  @override
  State<UserSessionScreen> createState() => _UserSessionScreenState();
}

class _UserSessionScreenState extends State<UserSessionScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _contactNumController = TextEditingController();
  ExtUserType _extUserType = ExtUserType.visitor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserSessionCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Session',
          ),
        ),
        body: SafeArea(
          child: _buildViews(),
        ),
      ),
    );
  }

  Widget _buildViews() {
    return SingleChildScrollView(
      child: BlocConsumer<UserSessionCubit, UserSessionState>(
        listener: _handleListener,
        builder: (context, state) {
          if (!state.isCheckedIn) {
            return _buildCheckInView(context, state);
          } else {
            return _buildCheckOutView(context, state);
          }
        },
      ),
    );
  }

  Widget _buildCheckInView(BuildContext context, UserSessionState state) {
    return Column(
      children: [
        if (state.isLoading)
          const LinearProgressIndicator(
            // value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Gap(40),
              const AutoSizeText(
                'Please provide the requested Information: ',
                minFontSize: 20,
                maxFontSize: 30,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    const Gap.expand(30),
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
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),
                    const Gap.expand(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownMenu<ExtUserType>(
                          width: MediaQuery.of(context).size.width * 0.4,
                          initialSelection: ExtUserType.visitor,
                          onSelected: (item) => _extUserType = item!,
                          // requestFocusOnTap is enabled/disabled by platforms when it is null.
                          // On mobile platforms, this is false by default. Setting this to true will
                          // trigger focus request on the text field and virtual keyboard will appear
                          // afterward. On desktop platforms however, this defaults to true.
                          requestFocusOnTap: false,
                          textStyle: const TextStyle(fontSize: 15),
                          dropdownMenuEntries: ExtUserType.values
                              .map<DropdownMenuEntry<ExtUserType>>(
                                  (ExtUserType extUserType) {
                            return DropdownMenuEntry<ExtUserType>(
                              value: extUserType,
                              label: extUserType.label,
                            );
                          }).toList(),
                        ),
                        const Gap(15),
                        Expanded(
                          child: TextFormField(
                            controller: _contactNumController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(50),
              FilledButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<UserSessionCubit>().checkInUser(
                      email: _emailController.text.trim(),
                      fullName: _fullNameController.text.trim(),
                      conNumber: _contactNumController.text.trim(),
                      extUserType: _extUserType);
                },
                child: const AutoSizeText(
                  'Check In',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                },
                child: const AutoSizeText(
                  'are you an admin? Tap here',
                  minFontSize: 10,
                  maxFontSize: 20,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCheckOutView(BuildContext context, UserSessionState state) {
    return Column(
      children: [
        if (state.isLoading)
          const LinearProgressIndicator(
            // value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        const Gap(40),
        const Center(
          child: AutoSizeText(
            'Checked In As:',
            minFontSize: 20,
            maxFontSize: 40,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText('Full Name: ',
                          maxFontSize: 20,
                          minFontSize: 18,
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      AutoSizeText(state.fullName,
                          maxFontSize: 20,
                          minFontSize: 18,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        'Email: ',
                        maxFontSize: 20,
                        minFontSize: 18,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AutoSizeText(state.emailId,
                          maxFontSize: 20,
                          minFontSize: 18,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        'Contact Number: ',
                        maxFontSize: 20,
                        minFontSize: 18,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AutoSizeText(state.conNumber,
                          maxFontSize: 20,
                          minFontSize: 18,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        'Role: ',
                        maxFontSize: 20,
                        minFontSize: 18,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AutoSizeText(state.extUserType?.label ?? 'N/A',
                          maxFontSize: 20,
                          minFontSize: 18,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: const AutoSizeText(
                            'Checked In at: ',
                            maxFontSize: 20,
                            minFontSize: 18,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            (state.checkedInTime != null)
                                ? yMMMMdjmFormatter(state.checkedInTime!)
                                : '--',
                            maxFontSize: 20,
                            minFontSize: 15,
                            style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        const Gap(50),
        FilledButton(
          onPressed: () {
            context.read<UserSessionCubit>().checkOutUser();
          },
          child: const Text(
            'Check Out',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }

  _handleListener(BuildContext context, UserSessionState state) {
    if (state.errorMessage.isNotEmpty) {
      showIntermediateErrorSnackBar(context, state.errorMessage);
    } else if (state.successMessage.isNotEmpty) {
      showIntermediateInfoSnackBar(context, state.successMessage);
    }
  }
}

enum ExtUserType {
  visitor('Visitor', 0),
  vendor('Vendor', 1),
  serviceProvider('Service Provider', 2),
  other('Other', 3);

  const ExtUserType(this.label, this.id);

  final String label;
  final int id;
}
