import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

void main() {
  group('ToolkitButton Widget Tests', () {
    testWidgets('creates button with text', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Test Button',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ToolkitButton), findsOneWidget);

      await tester.tap(find.byType(ToolkitButton));
      expect(wasPressed, true);
    });

    testWidgets('button with leading icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Button with Icon',
              leadingIcon: Icons.add,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Button with Icon'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('button with trailing icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Button with Icon',
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Button with Icon'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('disabled button state', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Disabled Button',
              state: ToolkitButtonState.disabled,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      // Wait for the postFrameCallback to execute and state to update
      await tester.pump();

      // Additional pump to ensure ValueListenableBuilder has updated
      await tester.pump();
      await tester.pump();

      expect(find.text('Disabled Button'), findsOneWidget);

      // Try to tap the disabled button - it should not respond
      await tester.tap(find.byType(ToolkitButton), warnIfMissed: false);
      await tester.pump();
      expect(wasPressed, false); // Should not be pressed when disabled
    });

    testWidgets('loading button state shows loading indicator', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Loading Button',
              state: ToolkitButtonState.loading,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      // Use pump instead of pumpAndSettle to avoid timeout with infinite animation
      await tester.pump();

      // Additional pumps to ensure ValueListenableBuilder and postFrameCallback have updated
      await tester.pump();
      await tester.pump();

      expect(find.byType(SizedLoadingIndicator), findsOneWidget);
      // Text should not be visible when loading
      expect(find.text('Loading Button'), findsNothing);

      // Verify that the button callback is not executed when loading
      await tester.tap(find.byType(ToolkitButton), warnIfMissed: false);
      await tester.pump();
      expect(wasPressed, false); // Should not be pressed when loading
    });

    testWidgets('button with custom style', (WidgetTester tester) async {
      const customStyle = ToolkitButtonStyle(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        borderRadius: 20.0,
        elevation: 8.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Custom Button',
              style: customStyle,
              onPressed: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Custom Button'), findsOneWidget);

      // Find the AnimatedContainer and check its decoration
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = animatedContainer.decoration as BoxDecoration;
      expect(decoration.color, Colors.red);
      expect(decoration.borderRadius, BorderRadius.circular(20.0));
    });

    testWidgets('button with gradient style', (WidgetTester tester) async {
      const gradientStyle = ToolkitButtonStyle(
        startGradientColor: Colors.blue,
        endGradientColor: Colors.green,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Gradient Button',
              style: gradientStyle,
              onPressed: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Gradient Button'), findsOneWidget);

      // Find the AnimatedContainer and check its gradient
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = animatedContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());

      final gradient = decoration.gradient as LinearGradient;
      expect(gradient.colors, [Colors.blue, Colors.green]);
    });

    testWidgets('outlined button factory constructor', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: Builder(
              builder: (context) => ToolkitButton.outlined(
                context,
                text: 'Outlined Button',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Outlined Button'), findsOneWidget);

      // Check that the button has border styling
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = animatedContainer.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
    });

    testWidgets('button state changes update correctly', (
      WidgetTester tester,
    ) async {
      ToolkitButtonState currentState = ToolkitButtonState.enabled;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  ToolkitButton(
                    text: 'State Button',
                    state: currentState,
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentState =
                            currentState == ToolkitButtonState.enabled
                            ? ToolkitButtonState.disabled
                            : ToolkitButtonState.enabled;
                      });
                    },
                    child: const Text('Toggle State'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initially enabled
      expect(currentState, ToolkitButtonState.enabled);

      // Toggle to disabled
      await tester.tap(find.text('Toggle State'));
      await tester.pumpAndSettle();

      // Wait for postFrameCallback and ValueListenableBuilder updates
      await tester.pump();
      await tester.pump();

      expect(currentState, ToolkitButtonState.disabled);

      // Toggle back to enabled
      await tester.tap(find.text('Toggle State'));
      await tester.pumpAndSettle();

      // Wait for postFrameCallback and ValueListenableBuilder updates
      await tester.pump();
      await tester.pump();

      expect(currentState, ToolkitButtonState.enabled);
    });

    testWidgets('button respects widget state controller', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(text: 'Test Button', onPressed: () {}),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Press down on the button (without releasing)
      final gesture = await tester.startGesture(
        tester.getCenter(find.byType(ToolkitButton)),
      );
      await tester.pump();

      // Check that the button has a pressed state (scale transform)
      final animatedContainer = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      expect(animatedContainer.transform, isNotNull);

      // Release the gesture
      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('button with both leading and trailing icons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Both Icons',
              leadingIcon: Icons.star,
              trailingIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Both Icons'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('button disposes controller properly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(text: 'Test Button', onPressed: () {}),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Remove the widget
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: SizedBox())),
      );

      // Should not throw any disposal errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('button enabled state allows interaction', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [WidgetToolkitTheme.light()]),
          home: Scaffold(
            body: ToolkitButton(
              text: 'Enabled Button',
              state: ToolkitButtonState.enabled,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.pump();
      await tester.pump();

      // Verify that the ElevatedButton's onPressed is not null (enabled)
      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(elevatedButton.onPressed, isNotNull);

      // Tap the enabled button
      await tester.tap(find.byType(ToolkitButton));
      await tester.pump();

      expect(wasPressed, true); // Should be pressed when enabled
    });
  });
}
