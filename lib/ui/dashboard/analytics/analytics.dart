import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:visitor_mgnt/ui/charts/pie_chart.dart';
import 'package:visitor_mgnt/ui/dashboard/analytics/analytics_view_cubit.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';

import 'package:visitor_mgnt/utilities/utilities.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnalyticsViewCubit()..init(),
      child: SingleChildScrollView(
        child: BlocConsumer<AnalyticsViewCubit, AnalyticsViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            final List<PieChartValues> pieChartValues = state
                .analyticsMap.entries
                .map((entry) => PieChartValues(
                    color: _userTypeColorsMap[entry.key]!,
                    value: entry.value.toDouble(),
                    label: entry.key.label))
                .toList();

            return Column(
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      if (state.selectedDateTime != null)
                        _dateContainer(context, state.selectedDateTime!),
                      const Gap(20),
                      AutoSizeText('Total Users: ${state.totalUsers}', minFontSize: 15,
                        maxFontSize: 30,
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      const Gap(20),
                      if(state.totalUsers > 0) PieChartWidget(
                          pieChartValues: pieChartValues, radius: 80),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _dateContainer(BuildContext buildContext, DateTime date) {
    final DateTime currentDate = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            buildContext
                .read<AnalyticsViewCubit>()
                .getUsersData(date.subtract(const Duration(days: 1)));
          },
          child: const Icon(
            Icons.arrow_left,
            size: 40,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(
            buildContext,
            date,
            currentDate,
          ),
          child: AutoSizeText(
            yMMMdFormatter(date),
            minFontSize: 15,
            maxFontSize: 30,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (!date.add(const Duration(days: 1)).isAfter(currentDate)) {
              buildContext
                  .read<AnalyticsViewCubit>()
                  .getUsersData(date.add(const Duration(days: 1)));
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

  Future<void> _selectDate(
      BuildContext context, DateTime selectedDate, DateTime today) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1000)),
      lastDate: today,
    ).then((value) {
      if (value != null && value != selectedDate) {
        context.read<AnalyticsViewCubit>().getUsersData(value);
      }
    });
  }
}

Map<ExtUserType, Color> _userTypeColorsMap = {
  ExtUserType.vendor: Colors.green,
  ExtUserType.visitor: Colors.blue,
  ExtUserType.serviceProvider: Colors.purple,
  ExtUserType.other: Colors.orange,
};

