import 'package:flutter/material.dart';

import 'constants.dart';
import 'theme/timeline.dart';
import 'timeline_node.dart';

enum TimelineNodeAlign {
  start,
  end,
  basic,
}

class TimelineTile extends StatelessWidget {
  const TimelineTile({
    super.key,
    this.direction,
    required this.node,
    this.nodeAlign = TimelineNodeAlign.basic,
    this.nodePosition,
    this.contents,
    this.oppositeContents,
    this.mainAxisExtent,
    this.crossAxisExtent,
  })  : assert(
          nodeAlign == TimelineNodeAlign.basic ||
              (nodeAlign != TimelineNodeAlign.basic && nodePosition == null),
          'Cannot provide both a nodeAlign and a nodePosition',
        ),
        assert(nodePosition == null || nodePosition >= 0);

  final Axis? direction;

  final Widget node;

  final TimelineNodeAlign nodeAlign;

  final double? nodePosition;

  final Widget? contents;

  final Widget? oppositeContents;

  final double? mainAxisExtent;

  final double? crossAxisExtent;

  double _getEffectiveNodePosition(BuildContext context) {
    if (nodeAlign == TimelineNodeAlign.start) return 0.0;
    if (nodeAlign == TimelineNodeAlign.end) return 1.0;
    final nodePos = nodePosition ??
        ((node is TimelineTileNode)
            ? (node as TimelineTileNode).getEffectivePosition(context)
            : TimelineTheme.of(context).nodePosition);
    return nodePos;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDirection = direction ?? TimelineTheme.of(context).direction;
    final nodeFlex = _getEffectiveNodePosition(context) * kFlexMultiplier;
    double minNodeExtent = TimelineTheme.of(context).indicatorTheme.size ?? 0.0;

    final items = <Widget>[
      if (nodeFlex > 0)
        Expanded(
          flex: nodeFlex.toInt(),
          child: Align(
            alignment: effectiveDirection == Axis.vertical
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.bottomCenter,
            child: oppositeContents ?? const SizedBox(),
          ),
        ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: direction == Axis.vertical ? minNodeExtent : 0.0,
          minHeight: direction == Axis.horizontal ? minNodeExtent : 0.0,
        ),
        child: node,
      ),
      if (nodeFlex < kFlexMultiplier)
        Expanded(
          flex: (kFlexMultiplier - nodeFlex).toInt(),
          child: Align(
            alignment: direction == Axis.vertical
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.topCenter,
            child: contents ?? const SizedBox.shrink(),
          ),
        ),
    ];

    Widget result;

    switch (effectiveDirection) {
      case Axis.vertical:
        result = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items,
        );

        if (mainAxisExtent != null) {
          result = SizedBox(
            width: crossAxisExtent,
            height: mainAxisExtent,
            child: result,
          );
        } else {
          result = IntrinsicHeight(
            child: result,
          );

          if (crossAxisExtent != null) {
            result = SizedBox(
              width: crossAxisExtent,
              child: result,
            );
          }
        }
        break;
      case Axis.horizontal:
        result = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items,
        );
        if (mainAxisExtent != null) {
          result = SizedBox(
            width: mainAxisExtent,
            height: crossAxisExtent,
            child: result,
          );
        } else {
          result = IntrinsicWidth(
            child: result,
          );

          if (crossAxisExtent != null) {
            result = SizedBox(
              height: crossAxisExtent,
              child: result,
            );
          }
        }
        break;
    }

    result = Align(
      child: result,
    );

    if (TimelineTheme.of(context).direction != effectiveDirection) {
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
