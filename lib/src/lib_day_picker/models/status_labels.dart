class StatusLabels {
  final String weekday;
  final String weekend;
  final String everyday;

  const StatusLabels({
    required this.weekday,
    required this.weekend,
    required this.everyday,
  });

  StatusLabels.withDefault()
      : weekday = 'Weekday',
        weekend = 'Weekend',
        everyday = 'Everyday';
}
