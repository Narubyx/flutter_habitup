import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int completed;
  final int goal;

  const ProgressBar({
    super.key,
    required this.completed,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (completed / goal).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Semana: $completed / $goal'),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: percent,
          backgroundColor: Colors.grey[300],
          color: Colors.indigo,
          minHeight: 8,
        ),
      ],
    );
  }
}