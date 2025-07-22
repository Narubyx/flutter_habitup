class Habit {
  final String id;
  final String name;
  final String emoji;
  final List<DateTime> completedDates;

  Habit({
    required this.id,
    required this.name,
    required this.emoji,
    List<DateTime>? completedDates,
  }) : completedDates = completedDates ?? [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji': emoji,
      'completedDates':
          completedDates.map((date) => date.toIso8601String()).toList(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      name: json['name'],
      emoji: json['emoji'] ?? '🏁',
      completedDates: (json['completedDates'] as List)
          .map((e) => DateTime.parse(e))
          .toList(),
    );
  }

  int completadoEstaSemana() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return completedDates.where((d) => d.isAfter(startOfWeek) || _isSameDay(d, startOfWeek)).length;
  }

  bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
}
