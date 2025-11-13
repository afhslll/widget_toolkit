import 'package:flutter/material.dart';

import 'connectors.dart';
import 'constants.dart';
import 'indicators.dart';
import 'theme/indicator.dart';
import 'theme/timeline.dart';

mixin TimelineTileNode on Widget {
  double? get position;
  double getEffectivePosition(BuildContext context) {
    return position ?? TimelineTheme.of(context).nodePosition;
  }
}

class TimelineNode extends StatelessWidget with TimelineTileNode {
  const TimelineNode({
    super.key,
    this.direction,
    this.startConnector,
    this.endConnector,
    this.indicator = const ContainerIndicator(),
    this.indicatorPosition,
    this.position,
    this.overlap,
  }) : assert(indicatorPosition == null ||
            0 <= indicatorPosition && indicatorPosition <= 1);

  final Axis? direction;
  final Widget? startConnector;
  final Widget? endConnector;
  final Widget indicator;
  final double? indicatorPosition;
  final bool? overlap;
  @override
  final double? position;

  double _getEffectiveIndicatorPosition(BuildContext context) {
    var indicatorPosition = this.indicatorPosition;
    indicatorPosition ??= (indicator is PositionedIndicator)
        ? (indicator as PositionedIndicator).getEffectivePosition(context)
        : TimelineTheme.of(context).indicatorPosition;
    return indicatorPosition;
  }

  bool _getEffectiveOverlap(BuildContext context) {
    return overlap ?? TimelineTheme.of(context).nodeItemOverlap;
  }

  @override
  Widget build(BuildContext context) {
    final direction = this.direction ?? TimelineTheme.of(context).direction;
    final overlap = _getEffectiveOverlap(context);
    final indicatorFlex = _getEffectiveIndicatorPosition(context);
    Widget line = indicator;
    final lineItems = <Widget>[
      if (indicatorFlex > 0)
        Flexible(
            flex: (indicatorFlex * kFlexMultiplier).toInt(),
            child: startConnector ?? TransparentConnector()),
      if (!overlap) indicator,
      if (indicatorFlex < 1)
        Flexible(
          flex: ((1 - indicatorFlex) * kFlexMultiplier).toInt(),
          child: endConnector ?? TransparentConnector(),
        ),
    ];

    switch (direction) {
      case Axis.vertical:
        line = Column(
          mainAxisSize: MainAxisSize.min,
          children: lineItems,
        );
        break;
      case Axis.horizontal:
        line = Row(
          mainAxisSize: MainAxisSize.min,
          children: lineItems,
        );
        break;
    }

    Widget result;
    if (overlap) {
      Widget positionedIndicator = indicator;
      final positionedIndicatorItems = [
        if (indicatorFlex > 0)
          Flexible(
            flex: (indicatorFlex * kFlexMultiplier).toInt(),
            child: TransparentConnector(),
          ),
        indicator,
        Flexible(
          flex: ((1 - indicatorFlex) * kFlexMultiplier).toInt(),
          child: TransparentConnector(),
        ),
      ];

      switch (direction) {
        case Axis.vertical:
          positionedIndicator = Column(
            mainAxisSize: MainAxisSize.min,
            children: positionedIndicatorItems,
          );
          break;
        case Axis.horizontal:
          positionedIndicator = Row(
            mainAxisSize: MainAxisSize.min,
            children: positionedIndicatorItems,
          );
          break;
      }

      result = Stack(
        alignment: Alignment.center,
        children: [
          line,
          positionedIndicator,
        ],
      );
    } else {
      result = line;
    }

    if (TimelineTheme.of(context).direction != direction) {
      result = TimelineTheme(
        data: TimelineTheme.of(context).copyWith(
          direction: direction,
        ),
        child: result,
      );
    }

    return result;
  }
}
