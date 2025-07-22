import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import '../widgets/habit_tile.dart';
import 'new_habit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Hábitos')),
      body: provider.habits.isEmpty
          ? const Center(child: Text('Agrega un hábito para comenzar.'))
          : ListView.builder(
              itemCount: provider.habits.length,
              itemBuilder: (context, index) {
                final habit = provider.habits[index];
                return HabitTile(habit: habit);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NewHabitPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}