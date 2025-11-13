import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'connector.dart';
import 'indicator.dart';

class TimelineTheme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const TimelineTheme({
    super.key,
    required this.data,
    required this.child,
  });

  /// Specifies the direction for descendant widgets.
  final TimelineThemeData data;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  static final TimelineThemeData _kFallbackTheme = TimelineThemeData.fallback();
  static TimelineThemeData of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return inheritedTheme?.theme.data ?? _kFallbackTheme;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: IndicatorTheme(
        data: data.indicatorTheme,
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TimelineThemeData>('data', data, showName: false));
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    required this.theme,
    required super.child,
  });

  final TimelineTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme =
        context.findAncestorWidgetOfExactType<_InheritedTheme>();
    return identical(this, ancestorTheme)
        ? child
        : TimelineTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}

@immutable
class TimelineThemeData with Diagnosticable {
  factory TimelineThemeData({
    Axis? direction,
    Color? color,
    double? nodePosition,
    bool? nodeItemOverlap,
    double? indicatorPosition,
  }) {
    direction ??= Axis.vertical;
    color ??= Colors.blue;
    nodePosition ??= 0.5;
    nodeItemOverlap ??= false;
    indicatorPosition ??= 0.5;

    return TimelineThemeData.raw(
      direction: direction,
      color: color,
      nodePosition: nodePosition,
      nodeItemOverlap: nodeItemOverlap,
      indicatorPosition: indicatorPosition,
      indicatorTheme: IndicatorThemeData(),
      connectorTheme: ConnectorThemeData(),
    );
  }

  /// The default direction theme. Same as [TimelineThemeData.vertical].
  ///
  /// This is used by [TimelineTheme.of] when no theme has been specified.
  factory TimelineThemeData.fallback() => TimelineThemeData.vertical();

  /// Create a [TimelineThemeData] given a set of exact values. All the values
  /// must be specified. They all must also be non-null.
  ///
  /// This will rarely be used directly. It is used by [lerp] to create
  /// intermediate themes based on two themes created with the
  /// [TimelineThemeData] constructor.
  const TimelineThemeData.raw({
    required this.direction,
    required this.color,
    required this.nodePosition,
    required this.nodeItemOverlap,
    required this.indicatorPosition,
    required this.indicatorTheme,
    required this.connectorTheme,
  });

  /// A default vertical theme.
  factory TimelineThemeData.vertical() => TimelineThemeData(
        direction: Axis.vertical,
      );

  /// A default horizontal theme.
  factory TimelineThemeData.horizontal() => TimelineThemeData(
        direction: Axis.horizontal,
      );

  /// {@macro timelines.direction}
  final Axis direction;

  /// The color for major parts of the timeline (indicator, connector, etc)
  final Color color;

  /// The position for [TimelineNode] in [TimelineTile].
  ///
  /// Defaults to 0.5.
  final double nodePosition;

  /// Determine whether each connectors and indicator will overlap in
  /// [TimelineNode].
  ///
  /// When each connectors overlap, they are drawn from the center offset of the
  /// indicator.
  final bool nodeItemOverlap;

  /// The position for indicator in [TimelineNode].
  ///
  /// Defaults to 0.5.
  final double indicatorPosition;

  /// A theme for customizing the appearance and layout of
  /// [ThemedIndicatorComponent] widgets.
  final IndicatorThemeData indicatorTheme;

  /// A theme for customizing the appearance and layout of
  /// [ThemedConnectorComponent] widgets.
  final ConnectorThemeData connectorTheme;

  /// Creates a copy of this theme but with the given fields replaced with the
  /// new values.
  TimelineThemeData copyWith({
    Axis? direction,
    Color? color,
    double? nodePosition,
    bool? nodeItemOverlap,
    double? indicatorPosition,
    IndicatorThemeData? indicatorTheme,
    ConnectorThemeData? connectorTheme,
  }) {
    return TimelineThemeData.raw(
      direction: direction ?? this.direction,
      color: color ?? this.color,
      nodePosition: nodePosition ?? this.nodePosition,
      nodeItemOverlap: nodeItemOverlap ?? this.nodeItemOverlap,
      indicatorPosition: indicatorPosition ?? this.indicatorPosition,
      indicatorTheme: indicatorTheme ?? this.indicatorTheme,
      connectorTheme: connectorTheme ?? this.connectorTheme,
    );
  }

  /// Linearly interpolate between two themes.
  ///
  /// The arguments must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static TimelineThemeData lerp(
      TimelineThemeData a, TimelineThemeData b, double t) {
    return TimelineThemeData.raw(
      direction: t < 0.5 ? a.direction : b.direction,
      color: Color.lerp(a.color, b.color, t)!,
      nodePosition: lerpDouble(a.nodePosition, b.nodePosition, t)!,
      nodeItemOverlap: t < 0.5 ? a.nodeItemOverlap : b.nodeItemOverlap,
      indicatorPosition:
          lerpDouble(a.indicatorPosition, b.indicatorPosition, t)!,
      indicatorTheme:
          IndicatorThemeData.lerp(a.indicatorTheme, b.indicatorTheme, t),
      connectorTheme:
          ConnectorThemeData.lerp(a.connectorTheme, b.connectorTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TimelineThemeData &&
        other.direction == direction &&
        other.color == color &&
        other.nodePosition == nodePosition &&
        other.nodeItemOverlap == nodeItemOverlap &&
        other.indicatorPosition == indicatorPosition &&
        other.indicatorTheme == indicatorTheme &&
        other.connectorTheme == connectorTheme;
  }

  @override
  int get hashCode {
    final values = <Object>[
      direction,
      color,
      nodePosition,
      nodeItemOverlap,
      indicatorPosition,
      indicatorTheme,
      connectorTheme,
    ];
    return Object.hashAllUnordered(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final defaultData = TimelineThemeData.fallback();
    properties
      ..add(DiagnosticsProperty<Axis>('direction', direction,
          defaultValue: defaultData.direction, level: DiagnosticLevel.debug))
      ..add(ColorProperty('color', color,
          defaultValue: defaultData.color, level: DiagnosticLevel.debug))
      ..add(DoubleProperty('nodePosition', nodePosition,
          defaultValue: defaultData.nodePosition, level: DiagnosticLevel.debug))
      ..add(FlagProperty('nodeItemOverlap',
          value: nodeItemOverlap, ifTrue: 'overlap connector and indicator'))
      ..add(DoubleProperty('indicatorPosition', indicatorPosition,
          defaultValue: defaultData.indicatorPosition,
          level: DiagnosticLevel.debug))
      ..add(DiagnosticsProperty<IndicatorThemeData>(
        'indicatorTheme',
        indicatorTheme,
        defaultValue: defaultData.indicatorTheme,
        level: DiagnosticLevel.debug,
      ))
      ..add(DiagnosticsProperty<ConnectorThemeData>(
        'connectorTheme',
        connectorTheme,
        defaultValue: defaultData.connectorTheme,
        level: DiagnosticLevel.debug,
      ));
  }
}
