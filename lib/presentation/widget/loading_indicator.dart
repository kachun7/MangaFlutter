import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingIndicator extends StatelessWidget {
  static const double indicatorHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Loading(indicator: BallPulseIndicator(), size: indicatorHeight, color: Theme.of(context).indicatorColor),
    );
  }
}
