import 'package:flutter/material.dart';

import 'line_painter.dart';
import 'theme/connector.dart';

abstract class Connector extends StatelessWidget with ThemedConnectorComponent {
  const Connector({
    super.key,
    this.direction,
    this.spacing,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  });

  factory Connector.solidLine({
    Key? key,
    Axis? direction,
    double? spacing,
    double? thickness,
    double? indent,
    double? endIndent,
    Color? color,
  }) = SolidLineConnector;

  factory Connector.transparent({
    Key? key,
    Axis? direction,
    double? indent,
    double? endIndent,
    double? spacing,
  }) = TransparentConnector;

  factory Connector.dashedLine({
    Key? key,
    Axis? direction,
    double? spacing,
    double? thickness,
    double? indent,
    double? endIndent,
    Color? color,
    double? dash,
    double? gap,
    Color? gapColor,
  }) = DashedLineConnector;

  @override
  final Axis? direction;

  @override
  final double? spacing;

  @override
  final double? thickness;

  @override
  final double? indent;

  @override
  final double? endIndent;

  @override
  final Color? color;
}

class SolidLineConnector extends Connector {
  const SolidLineConnector({
    super.key,
    super.thickness,
    super.spacing,
    super.indent,
    super.endIndent,
    super.color,
    Axis? direction,
  });

  @override
  Widget build(BuildContext context) {
    final direction = getEffectiveDirection(context);
    final thickness = getEffectiveThickness(context);
    final spacing = getEffectiveSpacing(context);
    final indent = getEffectiveIndent(context);
    final endIndent = getEffectiveEndIndent(context);
    final color = getEffectiveColor(context);

    switch (direction) {
      case Axis.vertical:
        return _ConnectorIndent(
          direction: direction,
          spacing: spacing,
          indent: indent,
          endIndent: endIndent,
          child: Container(
            width: thickness,
            color: color,
          ),
        );
      case Axis.horizontal:
        return _ConnectorIndent(
          direction: direction,
          spacing: spacing,
          indent: indent,
          endIndent: endIndent,
          child: Container(
            height: thickness,
            color: color,
          ),
        );
    }
  }
}

class DashedLineConnector extends Connector {
  const DashedLineConnector({
    super.key,
    super.direction,
    super.thickness,
    this.dash,
    this.gap,
    super.spacing,
    super.indent,
    super.endIndent,
    super.color,
    this.gapColor,
  });

  final double? dash;
  final double? gap;
  final Color? gapColor;

  @override
  Widget build(BuildContext context) {
    final direction = getEffectiveDirection(context);
    return _ConnectorIndent(
      direction: direction,
      indent: getEffectiveIndent(context),
      endIndent: getEffectiveEndIndent(context),
      spacing: getEffectiveSpacing(context),
      child: CustomPaint(
        painter: DashedLinePainter(
          direction: direction,
          color: getEffectiveColor(context),
          strokeWidth: getEffectiveThickness(context),
          dashSize: dash ?? 1.0,
          gapSize: gap ?? 1.0,
          gapColor: gapColor ?? Colors.transparent,
        ),
        child: Container(),
      ),
    );
  }
}

class TransparentConnector extends Connector {
  const TransparentConnector({
    super.key,
    super.spacing,
    super.indent,
    super.endIndent,
    super.color,
    Axis? direction,
  });

  @override
  Widget build(BuildContext context) {
    final direction = getEffectiveDirection(context);
    final spacing = getEffectiveSpacing(context);
    final indent = getEffectiveIndent(context);
    final endIndent = getEffectiveEndIndent(context);

    return _ConnectorIndent(
      direction: direction,
      spacing: spacing,
      indent: indent,
      endIndent: endIndent,
      child: SizedBox(),
    );
  }
}

class _ConnectorIndent extends StatelessWidget {
  const _ConnectorIndent({
    required this.direction,
    required this.spacing,
    this.indent,
    this.endIndent,
    required this.child,
  })  : assert(spacing == null || spacing >= 0),
        assert(indent == null || indent >= 0),
        assert(endIndent == null || endIndent >= 0);

  final Axis direction;
  final double? spacing;
  final double? indent;
  final double? endIndent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: direction == Axis.horizontal ? spacing : null,
      height: direction == Axis.vertical ? spacing : null,
      child: Center(
        child: Padding(
          padding: direction == Axis.vertical
              ? EdgeInsets.only(top: indent ?? 0, bottom: endIndent ?? 0)
              : EdgeInsets.only(left: indent ?? 0, right: endIndent ?? 0),
          child: child,
        ),
      ),
    );
  }
}
