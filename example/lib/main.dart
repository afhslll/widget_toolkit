import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_example/otp_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [
          WidgetToolkitTheme.light(),
          ItemPickerTheme.light(),
          SmsCodeTheme.light(),
        ],
      ),
      darkTheme: ThemeData(
        extensions: [
          WidgetToolkitTheme.dark(),
          ItemPickerTheme.dark(),
          SmsCodeTheme.dark(),
        ],
      ),
      themeMode: ThemeMode.system,
      home: OtpExample(),
    );
  }
}
