enum Days {
  sunday(
    label: 'Sun',
  ),
  monday(
    label: 'Mon',
  ),
  tuesday(
    label: 'Tue',
  ),
  wednesday(
    label: 'Wed',
  ),
  thursday(
    label: 'Thu',
  ),
  friday(
    label: 'Fri',
  ),
  saturday(
    label: 'Sat',
  ),
  ;

  final String label;

  const Days({
    required this.label,
  });
}
