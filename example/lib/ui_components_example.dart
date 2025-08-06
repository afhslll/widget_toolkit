import 'package:flutter/material.dart';
import 'package:widget_toolkit/item_picker.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';

class UiComponentsExample extends StatelessWidget {
  const UiComponentsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          spacing: 16,
          children: [
            ToolkitButton(
              text: 'Disabled button',
              state: ToolkitButtonState.disabled,
              onPressed: () {
                print('Disabled button pressed');
              },
            ),
            ToolkitButton(text: 'Filled button', onPressed: () {}),
            ToolkitButton.outlined(
              context,
              text: 'Outlined button',
              onPressed: () {},
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
  }
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
