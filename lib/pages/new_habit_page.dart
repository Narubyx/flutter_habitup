import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/habit.dart';
import '../providers/habit_provider.dart';

class NewHabitPage extends StatefulWidget {
  const NewHabitPage({super.key});

  @override
  State<NewHabitPage> createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> emojis = ['💪', '📚', '🧘', '🥗', '📝', '🚰'];
  String selectedEmoji = '💪';

  void _guardar() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    final newHabit = Habit(id: const Uuid().v4(), name: name, emoji: selectedEmoji,);
    Provider.of<HabitProvider>(context, listen: false).addHabit(newHabit);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Hábito')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nombre del hábito',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: emojis.map((emoji) {
                final isSelected = selectedEmoji == emoji;
                return ChoiceChip(
                  label: Text(emoji, style: const TextStyle(fontSize: 24)),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedEmoji = emoji;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _guardar,
              icon: const Icon(Icons.check),
              label: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}