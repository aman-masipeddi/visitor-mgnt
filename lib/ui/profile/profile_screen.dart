import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:visitor_mgnt/ui/bootstrap/initial/initial_screen.dart';
import 'package:visitor_mgnt/ui/profile/profile_cubit.dart';

import 'package:visitor_mgnt/utilities/utilities.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..getUserInformation(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
          ),
        ),
        body: SafeArea(
          child: _profileBody(),
        ),
      ),
    );
  }

  Widget _profileBody() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: _handleListener,
      builder: (context, state) {
        if (!(state.isLoading && state.emailId.isEmpty)) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  if (state.isLoading)
                    const LinearProgressIndicator(
                      // value: controller.value,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  const AutoSizeText(
                    'User Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const AutoSizeText(
                    '(Role: Admin)',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                  ),
                  const Gap(50),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
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
                                AutoSizeText(state.contactNumber,
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
                                  'Joined on: ',
                                  maxFontSize: 20,
                                  minFontSize: 18,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                AutoSizeText(
                                    (state.joinedDate != null)
                                        ? yMMMdFormatter(state.joinedDate!)
                                        : '--',
                                    maxFontSize: 20,
                                    minFontSize: 18,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  const Gap(
                    40,
                  ),
                  FilledButton(
                    onPressed: () {
                      context.read<ProfileCubit>().signOut();
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const LinearProgressIndicator(
            // value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          );
        }
      },
    );
  }

  _handleListener(BuildContext context, ProfileState state) {
    if (state.isSignOut) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const InitialScreen(),
        ),
      );
    }
  }
}
