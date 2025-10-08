import 'package:flutter/material.dart';

import '../models/day_labels.dart';
import '../models/days.dart';
import '../models/status_labels.dart';
import '../theme/day_picker_theme.dart';

class DayPicker extends StatefulWidget {
  const DayPicker({
    required this.titleText,
    this.dayLabels,
    this.statusLabels,
    this.errorText,
    this.initialValue,
    this.onChanged,
    super.key,
  });

  final String titleText;
  final DayLabels? dayLabels;
  final StatusLabels? statusLabels;
  final String? errorText;
  final List<Days>? initialValue;
  final ValueChanged<List<Days>>? onChanged;

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  List<Days> _selectedDays = [];

  @override
  void initState() {
    if (widget.initialValue != null) {
      _selectedDays = widget.initialValue!;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DayPicker oldWidget) {
    if (widget.initialValue != null &&
        widget.initialValue != oldWidget.initialValue) {
      _selectedDays = widget.initialValue!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.titleText, style: context.dayPickerTheme.titleStyle),
            if (_selectedDays.isNotEmpty)
              Text(_getStatusLabel(),
                  style: context.dayPickerTheme.statusStyle),
          ],
        ),
        Wrap(
            alignment: WrapAlignment.center,
            children: Days.values
                .map(
                  (day) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedDays.contains(day)) {
                          _selectedDays.remove(day);
                        } else {
                          _selectedDays.add(day);
                        }
                      });
                      widget.onChanged?.call(_selectedDays);
                    },
                    child: Padding(
                      padding: context.dayPickerTheme.itemPadding,
                      child: Text(
                        _getDayLabel(day),
                        style: _selectedDays.contains(day)
                            ? context.dayPickerTheme.selectedDayStyle
                            : context.dayPickerTheme.dayStyle,
                      ),
                    ),
                  ),
                )
                .toList()),
        if (widget.errorText != null)
          Text(widget.errorText!, style: context.dayPickerTheme.errorStyle),
      ],
    );
  }

  String _getDayLabel(Days day) {
    switch (day) {
      case Days.monday:
        return widget.dayLabels?.monday ?? day.label;
      case Days.tuesday:
        return widget.dayLabels?.tuesday ?? day.label;
      case Days.wednesday:
        return widget.dayLabels?.wednesday ?? day.label;
      case Days.thursday:
        return widget.dayLabels?.thursday ?? day.label;
      case Days.friday:
        return widget.dayLabels?.friday ?? day.label;
      case Days.saturday:
        return widget.dayLabels?.saturday ?? day.label;
      case Days.sunday:
        return widget.dayLabels?.sunday ?? day.label;
    }
  }

  String _getStatusLabel() {
    final statusLabels = widget.statusLabels ?? StatusLabels.withDefault();
    if (_selectedDays.length == Days.values.length) {
      return statusLabels.everyday;
    } else if (_selectedDays.length == 2 &&
        _selectedDays.contains(Days.saturday) &&
        _selectedDays.contains(Days.sunday)) {
      return statusLabels.weekend;
    } else if (_selectedDays.length == 5 &&
        !_selectedDays.contains(Days.saturday) &&
        !_selectedDays.contains(Days.sunday)) {
      return statusLabels.weekday;
    }
    return '';
  }
}
