import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../helpers/golden_helper.dart';

void main() {
  runUiComponentGoldenTests(
    scenario: 'toolkit_button_test',
    size: const Size(400, 100),
    scenarioPadding: const EdgeInsets.all(16),
    children: [
      ToolkitButton(
        text: 'Gradient button',
        leadingIcon: Icons.add,
        style: ToolkitButtonStyle(
          startGradientColor: Colors.purple,
          endGradientColor: Colors.teal,
        ),
        onPressed: () {},
      ),
      ToolkitButton(
        text: 'Filled button',
        trailingIcon: Icons.add,
        style: ToolkitButtonStyle(backgroundColor: Colors.pink),
        onPressed: () {},
      ),
      ToolkitButton(text: 'Disabled button'),
      ToolkitButton(text: 'Loading button', state: ToolkitButtonState.loading),
    ],
  );
}
