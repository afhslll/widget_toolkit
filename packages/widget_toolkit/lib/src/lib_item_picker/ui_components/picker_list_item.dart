import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../lib_shimmer/views/shimmer_text.dart';

class PickerListItem extends StatelessWidget {
  const PickerListItem({
    this.text,
    this.child,
    this.onTap,
    this.isSelected = false,
    this.isLoading = false,
    this.overrideStyle = true,
    super.key,
  }) : assert((text != null || child != null) || isLoading);

  final String? text;
  final Widget? child;
  final bool isSelected;
  final bool isLoading;
  final bool overrideStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Container(
    padding: overrideStyle ? null : context.itemPickerTheme.itemOuterPadding,
    child: Material(
      color: overrideStyle
          ? context.itemPickerTheme.itemUnselectedColor
          : isSelected
          ? context.itemPickerTheme.itemSelectedColor
          : context.itemPickerTheme.itemUnselectedColor,
      borderRadius: _radius(context),
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!.call(),
        borderRadius: _radius(context),
        child: Container(
          padding: overrideStyle
              ? null
              : context.itemPickerTheme.itemInnerPadding,
          child:
              child ??
              ShimmerText(
                isLoading ? null : text,
                style: context.itemPickerTheme.itemTextStyle,
              ),
        ),
      ),
    ),
  );

  BorderRadius _radius(BuildContext context) => BorderRadius.circular(
    overrideStyle ? 0 : context.itemPickerTheme.itemBorderRadius,
  );
}
