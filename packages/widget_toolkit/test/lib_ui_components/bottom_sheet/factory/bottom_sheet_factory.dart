import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

Widget bottomSheetFactory() => Scaffold(
  body: Builder(
    builder: (context) {
      return Center(
        child: ToolkitButton(
          text: 'Open bottom sheet',
          onPressed: () {
            showBlurredBottomSheet(
              context: context,
              headerText: 'Sheet Header',
              builder: (_) => Text('This is a bottom sheet!'),
            );
          },
        ),
      );
    },
  ),
);
