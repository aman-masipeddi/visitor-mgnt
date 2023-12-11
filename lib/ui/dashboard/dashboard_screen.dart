import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitor_mgnt/data_models/ext_user/ExtUser.dart';
import 'package:visitor_mgnt/ui/dashboard/analytics/analytics.dart';
import 'package:visitor_mgnt/utilities/utilities.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Activity',
              ),
              Tab(
                text: 'Analytics',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _activityView(),
            const AnalyticsView(),
          ],
        ),
      ),
    );
  }

  Widget _activityView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _dateContainer(selectedDate),
                FirestoreListView<ExtUser>(
                  query: FirebaseFirestore.instance
                      .collection(
                          'sessions-users-ext/${mmyyyyFormatter(selectedDate)}/${mmddyyyyFormatter(selectedDate)}')
                      .orderBy('checkInDateTime')
                      .withConverter(
                        fromFirestore: (snapshot, _) =>
                            ExtUser.fromJson(snapshot.data()!),
                        toFirestore: (extUser, _) => extUser.toJson(),
                      ),
                  pageSize: 20,
                  emptyBuilder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: const Center(
                        child: AutoSizeText(
                          'No activity found',
                          minFontSize: 10,
                          maxFontSize: 30,
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                      )),
                  loadingBuilder: (_) => const LinearProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) =>
                      Text(error.toString()),
                  itemBuilder: (context, doc) {
                    return _activityItem(doc.data());
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateContainer(DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date.subtract(const Duration(days: 1));
            });
          },
          child: const Icon(
            Icons.arrow_left,
            size: 40,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AutoSizeText(
            yMMMdFormatter(date),
            minFontSize: 15,
            maxFontSize: 30,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (!date.add(const Duration(days: 1)).isAfter(today)) {
              setState(() {
                selectedDate = date.add(const Duration(days: 1));
              });
            }
          },
          child: const Icon(
            Icons.arrow_right,
            size: 40,
          ),
        )
      ],
    );
  }

  _activityItem(ExtUser user) {
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  AutoSizeText(
                    user.fullName,
                    minFontSize: 10,
                    maxFontSize: 30,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    'Role: ${user.extUserType.userType.label}',
                    minFontSize: 10,
                    maxFontSize: 30,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                'Email:',
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                user.emailId,
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                'contact(#):',
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                user.contactNumber,
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                'Check in:',
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                yMMMMdjmFormatter(user.checkInDateTime),
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                'check out:',
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                (user.checkOutDateTime == null)
                                    ? 'N/A'
                                    : yMMMMdjmFormatter(user.checkOutDateTime!),
                                minFontSize: 10,
                                maxFontSize: 20,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today.subtract(const Duration(days: 1000)),
      lastDate: today,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
