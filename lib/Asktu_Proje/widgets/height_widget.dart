import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  final List<int> _items = [
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180
  ];

  int _selectedItem = 170;

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
