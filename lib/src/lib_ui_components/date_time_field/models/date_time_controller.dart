import 'package:flutter/material.dart';

class DateTimeController extends ValueNotifier<DateTime?> {
  DateTimeController({DateTime? initialValue})
      : super(initialValue ?? DateTime.now());
}
