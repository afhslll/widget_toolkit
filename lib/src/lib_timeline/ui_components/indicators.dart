import 'package:flutter/material.dart';

import 'theme/indicator.dart';

abstract class Indicator extends StatelessWidget
    with PositionedIndicator, ThemedIndicatorComponent {
  const Indicator({
    super.key,
    this.size,
    this.color,
    this.position,
    this.border,
    this.child,
  })  : assert(size == null || size >= 0),
        assert(position == null || position >= 0 && position <= 1);

  factory Indicator.dot({
    Key? key,
    double? size,
    Color? color,
    double? position,
    BoxBorder? border,
    Widget? child,
  }) = DotIndicator;

  factory Indicator.transparent({
    Key? key,
    double? size,
    double? position,
  }) =>
      ContainerIndicator(
        size: size,
        position: position,
      );

  factory Indicator.outlined({
    Key? key,
    double? size,
    Color? color,
    Color? backgroundColor,
    double? position,
    double borderWidth,
    Widget? child,
  }) = OutlinedDotIndicator;

  factory Indicator.widget({
    Key? key,
    double? size,
    double? position,
    Widget? child,
  }) =>
      ContainerIndicator(
        size: size,
        position: position,
        child: child,
      );

  @override
  final double? size;

  @override
  final Color? color;

  @override
  final double? position;

  final BoxBorder? border;

  final Widget? child;
}

class ContainerIndicator extends Indicator {
  const ContainerIndicator({
    super.key,
    super.size,
    super.position,
    super.child,
  }) : super(
          color: Colors.transparent,
        );

  @override
  Widget build(BuildContext context) {
    final size = getEffectiveSize(context);
    return SizedBox(
      width: size,
      height: size,
      child: child,
    );
  }
}

class DotIndicator extends Indicator {
  const DotIndicator({
    super.key,
    super.size,
    super.color,
    super.position,
    super.border,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSize = getEffectiveSize(context);
    final effectiveColor = getEffectiveColor(context);

    return Center(
      child: Container(
        width: effectiveSize ?? ((child == null) ? 15.0 : null),
        height: effectiveSize ?? ((child == null) ? 15.0 : null),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: effectiveColor,
          border: border,
        ),
        child: child,
      ),
    );
  }
}

class OutlinedDotIndicator extends Indicator {
  /// Creates a outlined dot indicator.
  ///
  /// The [size] must be null or non-negative.
  const OutlinedDotIndicator({
    super.key,
    super.size,
    super.color,
    super.position,
    this.backgroundColor,
    this.borderWidth = 2.0,
    super.child,
  })  : assert(size == null || size >= 0),
        assert(position == null || 0 <= position && position <= 1);

  final Color? backgroundColor;

  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      size: size,
      color: backgroundColor ?? Colors.transparent,
      position: position,
      border: Border.all(
        color: color ?? getEffectiveColor(context),
        width: borderWidth,
      ),
      child: child,
    );
  }
}
