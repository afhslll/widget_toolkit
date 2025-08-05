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

class DataModel extends PickerItemModel {
  DataModel({required this.name, required this.description});

  final String name;
  final String description;

  @override
  String get itemDisplayName => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModel &&
          runtimeType == other.runtimeType &&
          other.name == name &&
          other.description == description;

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  @override
  String toString() => name;
}

class DataService extends ItemPickerService<DataModel> {
  DataService();

  @override
  Future<List<DataModel>> getItems() => Future.delayed(
    const Duration(seconds: 3),
    () => List.generate(
      20,
      (index) => DataModel(
        name: 'Person $index',
        description:
            'This may be very long description for user named Person $index',
      ),
    ),
  );
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [WidgetToolkitTheme.light(), ItemPickerTheme.light()],
      ),
      darkTheme: ThemeData(
        extensions: [WidgetToolkitTheme.dark(), ItemPickerTheme.dark()],
      ),
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
                    text: 'Filled button',
                    onPressed: () {},
                    state: ToolkitButtonState.disabled,
                  ),
                  ToolkitButton(
                    text: 'Open bottom sheet',
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
                  ToolkitButton(
                    text: 'Open item picker',
                    leadingIcon: Icons.add,
                    onPressed: () {
                      showItemPickerBottomSheet<DataModel>(
                        context: context,
                        service: DataService(),
                        title: 'Picker Header',
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
