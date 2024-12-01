String? minutesToHours(int? minutes) {
  if (minutes == null) return null;
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;
  return '${hours}h ${remainingMinutes}m';
}
