import 'package:flutter/material.dart';

class ChipAccent extends StatelessWidget {
  const ChipAccent({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF111827),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}