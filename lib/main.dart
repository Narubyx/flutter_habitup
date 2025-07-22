import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/habit_provider.dart';

void main() {
  runApp(const HabitUpApp());
}

class HabitUpApp extends StatelessWidget {
  const HabitUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitProvider()..loadHabits(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HabitUp',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}