String? minutesToHours(int? minutes) {
  if (minutes == null) return null;
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;
  return '${hours}h ${remainingMinutes}m';
}


String? extractYear(String? date) {
  if (date == null) {
    return null;
  }
  List<String> parts = date.split('-');
  return parts.isNotEmpty ? parts[0] : null;
}
