class CounterOption {
  final int total;
  final String label;

  CounterOption({required this.total, required this.label});

  CounterOption copyWith({int? total, String? label}) {
    return CounterOption(
      total: total ?? this.total,
      label: label ?? this.label,
    );
  }

  @override
  String toString() {
    return 'CounterOption(total: $total, label: $label)';
  }
}
