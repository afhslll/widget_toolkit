import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/date_time_controller.dart';
import '../models/date_time_input_type.dart';

class DateTimeField extends StatefulWidget {
  const DateTimeField({
    this.inputType = DateTimeInputType.both,
    this.initialValue,
    this.textController,
    this.controller,
    this.decoration,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  final DateTimeInputType inputType;
  final DateTime? initialValue;
  final TextEditingController? textController;
  final DateTimeController? controller;
  final InputDecoration? decoration;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  DateTime? _value;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _value = widget.initialValue;
      widget.controller?.value = _value!;
    }
    widget.controller?.addListener(() {
      setState(() {
        _value = widget.controller?.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      onTap: Platform.isIOS ? onShowIosPicker : onShowAndroidPicker,
      readOnly: true,
      controller: widget.textController,
      decoration: widget.decoration,
      onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }

  Future<void> onShowAndroidPicker() async {
    switch (widget.inputType) {
      case DateTimeInputType.date:
        _value = await _showDatePicker();
        break;
      case DateTimeInputType.time:
        if (!context.mounted) break;
        _value = convert(await _showTimePicker());
        break;
      case DateTimeInputType.both:
        if (!context.mounted) break;
        _value = await _showDatePicker();
        if (_value != null) {
          if (!context.mounted) break;
          final time = await _showTimePicker();
          _value = combine(_value!, time);
        }
        break;
    }

    if (_value != null) {
      widget.controller?.value = _value!;
    }
  }

  Future<DateTime?> _showDatePicker() {
    return showDatePicker(
      context: context,
      initialDate: _value,
      firstDate:
          widget.firstDate ??
          DateTime.now().subtract(const Duration(days: 365 * 70)),
      lastDate:
          widget.lastDate ?? DateTime.now().add(const Duration(days: 365 * 5)),
    );
  }

  Future<TimeOfDay?> _showTimePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_value ?? DateTime.now()),
    );
  }

  void onShowIosPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          initialDateTime: _value,
          minimumDate: widget.firstDate,
          maximumDate: widget.lastDate,
          mode: getPickerMode(),
          onDateTimeChanged: (value) {
            _value = value;
            widget.controller?.value = value;
          },
        ),
      ),
    ).whenComplete(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  CupertinoDatePickerMode getPickerMode() {
    switch (widget.inputType) {
      case DateTimeInputType.date:
        return CupertinoDatePickerMode.date;
      case DateTimeInputType.time:
        return CupertinoDatePickerMode.time;
      case DateTimeInputType.both:
        return CupertinoDatePickerMode.dateAndTime;
    }
  }

  DateTime combine(DateTime date, TimeOfDay? time) => DateTime(
    date.year,
    date.month,
    date.day,
    time?.hour ?? 0,
    time?.minute ?? 0,
  );

  DateTime? convert(TimeOfDay? time) =>
      time == null ? null : DateTime(1, 1, 1, time.hour, time.minute);
}
