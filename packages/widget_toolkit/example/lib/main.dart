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
      theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
      darkTheme: ThemeData(extensions: [WidgetToolkitTheme.dark()]),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Plugin example app')),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                spacing: 16,
                children: [
                  ToolkitButton(
                    text: 'Gradient button',
                    leadingIcon: Icons.add,
                    onPressed: () {
                      showBlurredBottomSheet(
                        context: context,
                        headerText: 'Sheet Header',
                        builder: (_) => Text(
                          'Hello from bottom sheet',
                          style: context.widgetToolkitTheme.typography.bodyRegM,
                        ),
                      );
                    },
                    style: ToolkitButtonStyle(
                      startGradientColor: Colors.blue,
                      endGradientColor: Colors.green,
                      shadowColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
