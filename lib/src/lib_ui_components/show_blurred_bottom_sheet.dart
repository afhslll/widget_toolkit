import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../base/theme/widget_toolkit_theme.dart';

/// Flag controlling the state of whether a modal sheet is shown in case we want
/// to limit the number of modal sheets shown. It will be updated automatically
/// once a modal sheet opens or closes.
bool _isBottomSheetShown = false;

/// Displays a customizable modal sheet with a background blur effect. Requires
/// a [builder] method which returns the contents of the modal sheet.
///
/// You can also specify a [headerBuilder] builder method that returns a widget
/// which will be build above the contents of the widget returned from the
/// [builder]. Additionally, you can choose to toggle the display a modal sheet
/// pill cutout at the top of the modal sheet by setting the [showHeaderPill]
/// flag (defaults to `true`).
///
/// The [onCancelPressed] callback will be called when the modal sheet is
/// dismissed by the close button enabled from the modal sheet [configuration].
///
/// With the modal sheet [configuration], you can define or toggle different
/// aspects of the modal sheet.
Future<T?> showBlurredBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ModalConfiguration configuration = const ModalConfiguration(),
  String? headerText,
}) {
  // Dismiss any other modal sheets if only one is enforced
  if (configuration.haveOnlyOneSheet) {
    if (_isBottomSheetShown) {
      Navigator.pop(context);
    }

    _isBottomSheetShown = true;
  }
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    barrierColor: context.widgetToolkitTheme.bottomSheetBarrierColor,
    context: context,
    isScrollControlled: true,
    isDismissible: configuration.isDismissible,
    enableDrag: configuration.isDismissible,
    elevation: 0,
    builder: (context) => TweenAnimationBuilder<double>(
      builder: (context, sigma, child) {
        // According to this issue: https://stackoverflow.com/a/68891725
        // an error is logged if the sigma value is zero. We should avoid it by
        // setting it to some low value approaching zero (but not zero!).
        final sigmaVal = math.max(0.001, sigma);
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaVal, sigmaY: sigmaVal),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 200),
      tween: Tween(begin: 0.0, end: 5.0),
      child: _ModalContent(
        heightFactor: (configuration.fullScreen ?? false)
            ? _calculateFullScreenRatio(context)
            : configuration.heightFactor,
        builder: builder,
        headerText: headerText,
        showCloseButton: configuration.showCloseButton,
        contentAlignment: configuration.contentAlignment,
        showHeaderPill: configuration.showHeaderPill,
        safeAreaBottom: configuration.safeAreaBottom,
        dialogHasBottomPadding: configuration.dialogHasBottomPadding,
      ),
    ),
  ).then((value) {
    _isBottomSheetShown = false;
    return value;
  });
}

/// Widget used to represent the inner state of the app bottom modal sheet whose
/// contents are being rendered on screen.
class _ModalContent extends StatelessWidget {
  const _ModalContent({
    required this.builder,
    required this.showCloseButton,
    required this.showHeaderPill,
    required this.safeAreaBottom,
    required this.dialogHasBottomPadding,
    this.heightFactor,
    this.contentAlignment,
    this.headerText,
  });

  /// The builder method returning the contents of the modal sheet
  final WidgetBuilder builder;

  final String? headerText;

  /// Value for how much of the remaining screen size will the content take
  final double? heightFactor;

  /// Flag indicating whether or not to apply safe area at the bottom
  final bool safeAreaBottom;

  /// Flag indicating whether or not to display the pill cutout at the top of
  /// the header of the modal sheet
  final bool showHeaderPill;

  /// The content alignment along the vertical axis
  final MainAxisAlignment? contentAlignment;

  /// Flag indicating the visibility of the already implemented close button
  final bool showCloseButton;

  /// Flag indicating if bottom overlay should be added as padding at the bottom
  /// of the page
  final bool dialogHasBottomPadding;

  @override
  Widget build(BuildContext context) => heightFactor == null
      ? Container(
          margin: EdgeInsets.only(
            top: MediaQueryData.fromView(View.of(context)).padding.top,
          ),
          child: _buildContent(context),
        )
      : FractionallySizedBox(
          heightFactor: heightFactor,
          child: _buildContent(context),
        );

  Widget _buildContent(BuildContext context) {
    final mainContent = Column(
      mainAxisAlignment: contentAlignment ?? MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildPill(context),
        if (headerText != null)
          Padding(
            padding: context.widgetToolkitTheme.bottomSheetHeaderPadding,
            child: Text(
              headerText!,
              style: context.widgetToolkitTheme.typography.headlineRegS,
            ),
          ),
        Flexible(child: builder(context)),
      ],
    );

    return Container(
      padding: context.widgetToolkitTheme.bottomSheetContentPadding,
      decoration: BoxDecoration(
        color: context.widgetToolkitTheme.bottomSheetBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.widgetToolkitTheme.colors.shadow.withAlpha(100),
            blurRadius: 40,
            offset: const Offset(0, -1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            context.widgetToolkitTheme.bottomSheetTopRadius,
          ),
          topRight: Radius.circular(
            context.widgetToolkitTheme.bottomSheetTopRadius,
          ),
        ),
      ),
      child: SafeArea(bottom: true, child: mainContent),
    );
  }

  Widget _buildPill(BuildContext context) => Center(
    child: Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: context.widgetToolkitTheme.bottomSheetLineColor,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}

/// App Modal sheet configuration used for controlling different parts and
/// options of a modal sheet, such as height factor, header pill or the close
/// button.
///
/// If [fullScreen] is true, this flag ignores the [heightFactor] and calculate
/// the ratio for the full screen.
/// The [heightFactor] of the modal sheet defined within the range of (0,1]
///
/// Close button will be displayed at the very bottom of the page if
/// [showCloseButton] is true. Defaults to true.
///
/// A small decoration line will be added to the top of the modal if [showHeaderPill]
///
/// [dialogHasBottomPadding] defines if we want to add viewInsets.bottom as
/// bottom padding to our BottomSheet. viewInsets.bottom is the parts of
/// the display that are completely obscured by system UI, typically by the
/// device's keyboard. Defaults to true.
/// Set it false if want to allow the keyboard to overlap over the content.
///
/// [safeAreaBottom] is used to add or not the bottom safe area to our bottom sheet.
/// Defaults to true.
/// If set it false, [additionalBottomPadding] will be applied.
///
/// [isDismissible] indicates whether the modal sheet is dismissible or not
///
/// Flag [haveOnlyOneSheet] allows only to have one modal sheet open at a time
///
/// Align the content within the modal sheet using [contentAlignment]
class ModalConfiguration {
  const ModalConfiguration({
    this.fullScreen = false,
    this.heightFactor,
    this.showCloseButton = true,
    this.dialogHasBottomPadding = true,
    this.safeAreaBottom = false,
    this.showHeaderPill = true,
    this.isDismissible = true,
    this.haveOnlyOneSheet = true,
    this.contentAlignment,
  });

  /// If [fullScreen] is true, this flag ignores the [heightFactor] and calculate
  /// the ratio for the full screen
  final bool? fullScreen;

  /// The [heightFactor] of the modal sheet defined within the range of (0,1]
  final double? heightFactor;

  /// Flag indicating whether or not to show the close button
  final bool showCloseButton;

  /// Should we add viewInsets.bottom as bottom padding to our BottomSheet.
  /// viewInsets.bottom is the parts of the display that are completely obscured
  /// by system UI, typically by the device's keyboard.
  /// Defaults to true.
  /// Set it false if want to allow the keyboard to overlap over the content.
  final bool dialogHasBottomPadding;

  /// Should we include the bottom safe area when applying a safe area
  /// Defaults to true.
  /// If set it false, [additionalBottomPadding] will be applied.
  final bool safeAreaBottom;

  /// Flag indicating whether to show the header pill-cutout on the modal sheet
  final bool showHeaderPill;

  /// Flag indicating whether the modal sheet is dismissible or not
  final bool isDismissible;

  /// Flag allowing only to have one modal sheet open at a time
  final bool haveOnlyOneSheet;

  /// Alignment of the content within the modal sheet
  final MainAxisAlignment? contentAlignment;
}

double _calculateFullScreenRatio(BuildContext context) {
  final statusBarHeight = MediaQueryData.fromView(View.of(context)).padding.top;
  final totalHeight = MediaQueryData.fromView(View.of(context)).size.height;
  return 1 - statusBarHeight / totalHeight;
}
