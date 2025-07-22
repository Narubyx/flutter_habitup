import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../services/habit_storage_service.dart';

class HabitProvider extends ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  Future<void> loadHabits() async {
    final stored = await HabitStorageService.loadHabits();
    _habits.clear();
    _habits.addAll(stored);
    notifyListeners();
  }

  Future<void> addHabit(Habit habit) async {
    _habits.add(habit);
    await HabitStorageService.saveHabits(_habits);
    notifyListeners();
  }

  Future<void> toggleHabitCompletion(Habit habit, DateTime date) async {
    if (habit.completedDates.any((d) => _isSameDay(d, date))) {
      habit.completedDates.removeWhere((d) => _isSameDay(d, date));
    } else {
      habit.completedDates.add(date);
    }
    await HabitStorageService.saveHabits(_habits);
    notifyListeners();
  }

  Future<void> deleteHabit(String id) async {
    _habits.removeWhere((h) => h.id == id);
    await HabitStorageService.saveHabits(_habits);
    notifyListeners();
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}