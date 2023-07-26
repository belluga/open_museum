import 'package:flutter/material.dart';

class MaxDistanceSelector extends StatelessWidget {
  final Function(int?) onChanged;

  const MaxDistanceSelector({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(items: const [
      DropdownMenuItem(
        value: 5,
        child: Text("5 km"),
      ),
      DropdownMenuItem(
        value: 5,
        child: Text("10 km"),
      ),
      DropdownMenuItem(
        value: 5,
        child: Text("20 km"),
      ),
      DropdownMenuItem(
        value: 5,
        child: Text("30 km"),
      ),
      DropdownMenuItem(
        value: 5,
        child: Text("40 km"),
      ),
      DropdownMenuItem(
        value: 5,
        child: Text("50 km"),
      ),
    ], onChanged: onChanged);
  }
}
