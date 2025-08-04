import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

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
      theme: ThemeData(extensions: [WidgetToolkitTheme.light().copyWith()]),
      darkTheme: ThemeData(extensions: [WidgetToolkitTheme.dark()]),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            spacing: 16,
            children: [
              ToolkitButton(
                text: 'Disabled button',
                onPressed: () {},
                state: ToolkitButtonState.disabled,
                style: ToolkitButtonStyle(
                  disabledBackgroundColor: Colors.grey.shade300,
                  disabledForegroundColor: Colors.grey.shade700,
                  borderRadius: 40.0,
                ),
              ),
              ToolkitButton(
                text: 'Loading button',
                onPressed: () {},
                state: ToolkitButtonState.loading,
              ),
              ToolkitButton(
                text: 'Filled button with icon',
                onPressed: () {},
                leadingIcon: Icons.add,
                style: ToolkitButtonStyle(foregroundColor: Colors.yellow),
              ),
              ToolkitButton(
                text: 'Gradient button',
                leadingIcon: Icons.add,
                onPressed: () {},
                style: ToolkitButtonStyle(
                  startGradientColor: Colors.blue,
                  endGradientColor: Colors.green,
                  shadowColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
