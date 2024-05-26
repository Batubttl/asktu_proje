import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class GaugeWidget extends StatelessWidget {
  final double value;
  final double maxValue;
  final double radius;
  final double thickness;
  final Widget? icon;

  const GaugeWidget({
    super.key,
    required this.value,
    required this.maxValue,
    this.radius = 100,
    this.thickness = 20,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: icon != null
              ? icon!
              : Text(
                  value.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        AnimatedRadialGauge(
          duration: const Duration(seconds: 1),
          curve: Curves.elasticOut,
          radius: radius,
          value: value,
          progressBar: GaugeRoundedProgressBar(color: Colors.green),
          axis: GaugeAxis(
            pointer: null,
            min: 0,
            max: maxValue,
            degrees: 225,
            style: GaugeAxisStyle(
              thickness: thickness,
              background: const Color(0xFFDFE2EC),
              segmentSpacing: 4,
            ),
            segments: [
              GaugeSegment(
                from: 0,
                to: maxValue,
                color: const Color(0xFFD9DEEB),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
