import 'package:flutter/material.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({super.key});

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  final List<int> _items = [
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
  ];

  int _selectedItem = 70;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<int>(
        value: _selectedItem,
        onChanged: (int? newValue) {
          setState(() {
            _selectedItem = newValue!;
          });
        },
        items: _items.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }
}
