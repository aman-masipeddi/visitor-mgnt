// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    Key? key,
    required this.pieChartValues,
    required this.radius,
  }) : super(key: key);

  final List<PieChartValues> pieChartValues;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child:  PieChart(
                PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 70,
                  sections: showingSections(pieChartValues),
                ),
              ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _indicatorsList(pieChartValues),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(List<PieChartValues> values) {
    return List.generate(values.length, (i) {
      return PieChartSectionData(
        color: values[i].color,
        value: values[i].value,
        title: '${values[i].value}%',
        radius: radius,
        showTitle: true,
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      );
    });
  }

  List<Indicator> _indicatorsList(List<PieChartValues> pieChartValues) {
    return List.generate(
        pieChartValues.length,
        (index) => Indicator(
            color: pieChartValues[index].color,
            text: pieChartValues[index].label,
            isSquare: true));
  }
}

class PieChartValues {
  final Color color;
  final double value;
  final String label;

  PieChartValues({
    required this.color,
    required this.value,
    required this.label,
  });
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
