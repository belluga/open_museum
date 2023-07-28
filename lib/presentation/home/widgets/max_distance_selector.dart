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
          value: 1000,
          child: Text("Até 1 km"),
        ),
        DropdownMenuItem(
          value: 5000,
          child: Text("Até 5 km"),
        ),
        DropdownMenuItem(
          value: 10000,
          child: Text("Até 10 km"),
        ),
        DropdownMenuItem(
          value: 20000,
          child: Text("Até 20 km"),
        ),
        DropdownMenuItem(
          value: 30000,
          child: Text("Até 30 km"),
        ),
        DropdownMenuItem(
          value: 40000,
          child: Text("Até 40 km"),
        ),
        DropdownMenuItem(
          value: 50000,
          child: Text("Até 50 km"),
        ),
        DropdownMenuItem(
          value: 50000000,
          child: Text("Até 50000 km"),
        ),
      ],
    );
  }
}
