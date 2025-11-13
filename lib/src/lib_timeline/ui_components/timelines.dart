import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'theme/timeline.dart';
import 'timeline_tile_builder.dart';

class Timeline extends BoxScrollView {
  Timeline({
    super.key,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.itemExtent,
    this.theme,
    Axis? scrollDirection,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
  })  : childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        assert(scrollDirection == null || theme == null,
            'Cannot provide both a scrollDirection and a theme.'),
        super(
          scrollDirection: scrollDirection ?? theme?.direction ?? Axis.vertical,
          semanticChildCount: semanticChildCount ?? children.length,
        );

  factory Timeline.tileBuilder({
    Key? key,
    required TimelineTileBuilder builder,
    Axis? scrollDirection,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
    TimelineThemeData? theme,
  }) {
    assert(builder.itemCount >= 0);
    assert(
        semanticChildCount == null || semanticChildCount <= builder.itemCount);
    return Timeline.custom(
      key: key,
      childrenDelegate: SliverChildBuilderDelegate(
        builder.build,
        childCount: builder.itemCount,
      ),
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount ?? builder.itemCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      theme: theme,
    );
  }

  Timeline.builder({
    super.key,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.theme,
    required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    Axis? scrollDirection,
    int? semanticChildCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : childrenDelegate = SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        assert(itemCount >= 0),
        assert(semanticChildCount == null || semanticChildCount <= itemCount),
        assert(scrollDirection == null || theme == null,
            'Cannot provide both a scrollDirection and a theme.'),
        super(
          scrollDirection: scrollDirection ?? theme?.direction ?? Axis.vertical,
          semanticChildCount: semanticChildCount ?? itemCount,
        );

  Timeline.custom({
    super.key,
    Axis? scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.itemExtent,
    required this.childrenDelegate,
    this.theme,
  })  : assert(scrollDirection == null || theme == null,
            'Cannot provide both a scrollDirection and a theme.'),
        super(
          scrollDirection: scrollDirection ?? theme?.direction ?? Axis.vertical,
        );

  final double? itemExtent;

  final SliverChildDelegate childrenDelegate;

  final TimelineThemeData? theme;

  @override
  Widget buildChildLayout(BuildContext context) {
    Widget result;

    if (itemExtent != null) {
      result = SliverFixedExtentList(
        delegate: childrenDelegate,
        itemExtent: itemExtent!,
      );
    } else {
      result = SliverList(
        delegate: childrenDelegate,
      );
    }

    TimelineThemeData? t = theme;
    if (t != null) {
    } else if (scrollDirection != TimelineTheme.of(context).direction) {
      t = TimelineTheme.of(context).copyWith(direction: scrollDirection);
    }

    if (t != null) {
      result = TimelineTheme(
        data: t,
        child: result,
      );
    }
    return result;
  }
}

class FixedTimeline extends StatelessWidget {
  factory FixedTimeline.tileBuilder({
    Key? key,
    required TimelineTileBuilder builder,
    TimelineThemeData? theme,
    Axis? direction,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
  }) {
    return FixedTimeline(
      theme: theme,
      direction: direction,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: [
        for (int i = 0; i < builder.itemCount; i++)
          Builder(
            builder: (context) => builder.build(context, i),
          ),
      ],
    );
  }

  const FixedTimeline({
    super.key,
    this.theme,
    this.direction,
    this.children = const <Widget>[],
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.hardEdge,
  }) : assert(direction == null || theme == null,
            'Cannot provide both a direction and a theme');

  final TimelineThemeData? theme;

  final Axis? direction;

  final List<Widget> children;

  final MainAxisSize mainAxisSize;

  final TextDirection? textDirection;

  final VerticalDirection verticalDirection;

  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final d = direction ?? theme?.direction ?? Axis.vertical;

    Widget result = Flex(
      direction: d,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: children,
    );

    TimelineThemeData? t = theme;

    if (d != TimelineTheme.of(context).direction) {
      t = TimelineTheme.of(context).copyWith(direction: direction);
    }

    if (t != null) {
      result = TimelineTheme(
        data: t,
        child: result,
      );
    }
    return result;
  }
}
