import 'package:flutter/material.dart';

class MaxDistanceSelector extends StatelessWidget {
  final int currentValue;
  final Function(int?) onChanged;

  const MaxDistanceSelector({
    super.key,
    required this.onChanged,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      onChanged: onChanged,
      value: currentValue,
      items: const [
        DropdownMenuItem(
          value: 5,
          child: Text("5 km"),
        ),
        DropdownMenuItem(
          value: 10,
          child: Text("10 km"),
        ),
        DropdownMenuItem(
          value: 20,
          child: Text("20 km"),
        ),
        DropdownMenuItem(
          value: 30,
          child: Text("30 km"),
        ),
        DropdownMenuItem(
          value: 40,
          child: Text("40 km"),
        ),
        DropdownMenuItem(
          value: 50,
          child: Text("50 km"),
        ),
      ],
    );
  }
}
