extension DateTimeUtile on DateTime {
  String toIso8601OnlyHour({int offsetInHours = 9}) {
    final dateTimeUtc = DateTime.utc(0, 1, 1, hour, minute);
    final dateTimeLocal = dateTimeUtc.add(Duration(hours: offsetInHours));
    final h = dateTimeLocal.hour.toString().padLeft(2, '0');
    final m = dateTimeLocal.minute.toString().padLeft(2, '0');
    return "$h:$m";
  }
}
