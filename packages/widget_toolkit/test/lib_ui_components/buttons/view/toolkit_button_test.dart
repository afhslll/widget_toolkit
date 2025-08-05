import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../helpers/golden_helper.dart';

void main() {
  runUiComponentGoldenTests(
    scenario: 'toolkit_button_test',
    size: const Size(450, 100),
    scenarioPadding: const EdgeInsets.all(16),
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
  );
}
