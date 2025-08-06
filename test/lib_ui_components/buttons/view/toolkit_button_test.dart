import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../helpers/golden_helper.dart';

// TODO: disabled button still showing enabled state in golden tests
void main() {
  runUiComponentGoldenTests(
    scenario: 'toolkit_button_test',
    size: const Size(600, 100),
    scenarioPadding: const EdgeInsets.all(16),
    act: (tester) async {
      await tester.pump();
      await tester.pump();
      await tester.pump();
    },
    children: [
      ToolkitButton(
        text: 'Disabled button',
        state: ToolkitButtonState.disabled,
        onPressed: () {},
      ),
      ToolkitButton(text: 'Filled button', onPressed: () {}),
      Builder(
        builder: (context) {
          return ToolkitButton.outlined(
            context,
            text: 'Outlined button',
            onPressed: () {},
          );
        },
      ),
      ToolkitButton(
        text: 'Open bottom sheet',
        leadingIcon: Icons.add,
        onPressed: () {},
        style: ToolkitButtonStyle(
          startGradientColor: Colors.blue,
          endGradientColor: Colors.green,
          shadowColor: Colors.blue,
        ),
      ),
      ToolkitButton(
        text: 'Open item picker',
        leadingIcon: Icons.add,
        onPressed: () {},
        style: ToolkitButtonStyle(
          startGradientColor: Colors.blue,
          endGradientColor: Colors.green,
          shadowColor: Colors.blue,
        ),
      ),
    ],
  );
}
