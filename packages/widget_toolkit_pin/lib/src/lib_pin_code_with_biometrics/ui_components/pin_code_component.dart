import 'dart:ui';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit/shimmer.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../../base/utils/utils.dart';
import '../models/biometrics_authentication_type.dart';
import 'pin_code_biometric_key_with_auto_submit.dart';
import 'pin_code_delete_key.dart';
import 'pin_code_key.dart';

class PinCodeComponent extends StatefulWidget {
  const PinCodeComponent({
    required this.translateError,
    required this.pinLength,
    required this.localizedReason,
    this.biometricsLocalDataSource,
    this.mapBiometricMessageToString,
    this.onAuthenticated,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.error,
    super.key,
  });

  /// Receives the error from bloc's error state
  final ErrorModel? error;

  /// The pin code length
  final int pinLength;

  /// The biometrics enabling reason
  final String localizedReason;

  /// Data source, which stores a flag if biometrics are enabled for the app.
  final BiometricsLocalDataSource? biometricsLocalDataSource;

  /// Handle the translation of the error from the errors stream
  final String Function(Object error) translateError;

  /// [mapBiometricMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapBiometricMessageToString;

  /// Called when a user is authenticated with biometrics successfully
  // final void Function(bool)? isAuthenticatedWithBiometrics;

  /// Returns the verification state of the input from the pin code auto submit value.
  final void Function(bool)? onAuthenticated;

  /// Provide custom implementation for the most down left button. Do not forget
  /// to make it clickable. Default to LeftArrow.
  final PinCodeCustomKey? deleteKeyButton;

  /// Provide custom implementation for the most down right button. Do not forget
  /// to make it clickable.
  final PinCodeCustomKey? bottomRightKeyboardButton;

  @override
  State<PinCodeComponent> createState() => _PinCodeComponentState();
}

class _PinCodeComponentState extends State<PinCodeComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool hasErrorText = false;
  bool isLoading = false;
  bool pinIsDeleted = false;

  static final _shakeTweenSequence = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.5, end: 1)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 100,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(0),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(0),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.5)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 100,
      ),
    ],
  );

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _shakeTweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PinCodeComponent oldWidget) {
    if (widget.error != null && !isLoading) {
      _startErrorAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          RxBlocListener<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.isLoading,
            listener: (
              context,
              isLoadingSnapshot,
            ) {
              setState(() {
                isLoading = isLoadingSnapshot;
              });
            },
          ),
          RxBlocListener<PinCodeBlocType, void>(
            state: (bloc) => bloc.states.authenticated,
            listener: (context, isAuthenticated) {
              _onStateChanged;
            },
          ),
          _buildBuilders()
        ],
      );

  Widget _buildBuilders() => Expanded(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.pinCodeTheme.primaryGradientStart,
                context.pinCodeTheme.primaryGradientEnd
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 20),
          child: RxBlocBuilder<PinCodeBlocType, int>(
            state: (bloc) => bloc.states.digitsCount,
            builder: (context, pinLength, bloc) => _buildPageContent(
              pinLength: _pinLengthData(pinLength),
              context: context,
            ),
          ),
        ),
      );

  int _pinLengthData(AsyncSnapshot<int> pinLength) {
    if (pinLength.hasData && pinLength.data != null) {
      return pinLength.data!;
    }
    return 0;
  }

  bool _hasBiometricsScan(
          AsyncSnapshot<bool> areBiometricsEnabled,
          AsyncSnapshot<List<BiometricsAuthType>> availableBiometrics,
          BiometricsAuthType type) =>
      areBiometricsEnabled.hasData &&
      areBiometricsEnabled.data! &&
      availableBiometrics.hasData &&
      availableBiometrics.data!.contains(type);

  Widget _buildPageContent({
    required int pinLength,
    required BuildContext context,
  }) =>
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            _buildAnimatedKeysBuilder(context, pinLength),
            const Spacer(flex: 3),
            _buildKeyboard(
              verticalSpacing: MediaQuery.of(context).size.height / 45,
              context: context,
              pinLength: pinLength,
            ),
          ],
        ),
      );

  /// region Builders

  Widget _buildAnimatedKeysBuilder(BuildContext context, int pinLength) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Align(
          alignment: Alignment(
            lerpDouble(-0.1, 0.1, _shakeTweenSequence.evaluate(_controller))!,
            0,
          ),
          child: child,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            if (hasErrorText) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            } else {
              return AnimatedSwitcher.defaultTransitionBuilder
                  .call(child, animation);
            }
          },
          child: hasErrorText && widget.error is ErrorWrongPin
              ? _buildErrorText(context)
              : RxBlocBuilder<PinCodeBlocType, int>(
                  state: (bloc) => bloc.states.digitsCount,
                  builder: (context, pinLength, bloc) =>
                      _buildMaskedKeysRow(context, pinLength.data ?? 0),
                ),
        ),
      );

  Widget _buildErrorText(BuildContext context) => Text(
        widget.translateError((widget.error as ErrorWrongPin)),
        style: context.pinCodeTheme.captionBold
            .copyWith(color: context.pinCodeTheme.lightRed),
      );

  Future<void> _startErrorAnimation() async {
    await _controller.forward(from: 0);
    if (widget.error is ErrorWrongPin) {
      setState(() {
        hasErrorText = true;
      });
    }

    if (widget.error is ErrorWrongPin) {
      await Future.delayed(const Duration(seconds: 2));
    }
    if (mounted) {
      setState(() {
        hasErrorText = false;
      });
    }
  }

  Widget _buildMaskedKeysRow(BuildContext context, int pinLength) =>
      IntrinsicWidth(
        child: isLoading
            ? ShimmerWrapper(
                baseColor: context.pinCodeTheme.shimmerBaseColor,
                highlightColor: context.pinCodeTheme.shimmerHighlightColor,
                showShimmer: true,
                child: _buildInLayout(pinLength),
              )
            : _buildInLayout(pinLength),
      );

  Widget _buildInLayout(int pinLength) => pinLength <= _calculateRowLength()
      ? Row(
          children: _buildMaskedKeys(true, pinLength),
        )
      : SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: _calculateMaskSize(context),
                crossAxisSpacing: _getDistance(),
                mainAxisSpacing: _calculateMaskSize(context),
              ),
              children: _buildMaskedKeys(false, pinLength)),
        );

  List<Widget> _buildMaskedKeys(bool row, int pinLength) {
    List<Widget> widgets = [];
    for (int i = 0; i < pinLength; i++) {
      if (i != 0 && row) widgets.add(SizedBox(width: _getDistance()));
      widgets.add(_buildMaskedKey());
    }
    return widgets;
  }

  Widget _buildMaskedKey() => Container(
      width: _calculateMaskSize(context),
      height: _calculateMaskSize(context),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.pinCodeTheme.pinKeyboardMaskedKeyBorderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(_calculateMaskSize(context) / 2),
        color: context.pinCodeTheme.pinKeyboardMaskedKeyColor,
      ));

  double _getDistance() => context.pinCodeTheme.spacing1;

  double _calculateMaskSize(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 15;
    if (size < 16) return 16;
    if (size > 32) return 32;
    return size;
  }

  int _calculateRowLength() {
    double itemWidth = _calculateMaskSize(context) + _getDistance();
    double availableWidth = MediaQuery.of(context).size.width * 0.8;
    return availableWidth ~/ itemWidth;
  }

  Widget _buildKeyboard({
    required double verticalSpacing,
    required BuildContext context,
    required int pinLength,
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 1)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 4)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 7)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: calculateKeyboardButtonSize(context),
                width: calculateKeyboardButtonSize(context),
                child: Center(
                  child: Container(),
                ),
              ),
              _buildPinCodeKey(context, 0, 0),
              _buildBiometricsButton(
                context,
                pinLength,
                // pin
              ),
            ],
          ),
        ],
      );

  Widget _buildPinCodeKey(BuildContext context, int index, int number) =>
      PinCodeKey(
        number: index + number,
        isLoading: isLoading,
        onPressed: (key) {
          context.read<PinCodeBlocType>().events.addDigit(key.toString());
        },
      );

  Widget _buildBiometricsButton(
    BuildContext context,
    int pinLength,
  ) =>
      SizedBox(
        height: calculateKeyboardButtonSize(context),
        width: calculateKeyboardButtonSize(context),
        child: Center(
          child: widget.bottomRightKeyboardButton ??
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: RxBlocBuilder<PinCodeBlocType, bool>(
                  state: (bloc) => bloc.states.showBiometricsButton,
                  builder: (context, snapshot, bloc) => _buildButtonContent(
                    context,
                    snapshot.data ?? false,
                    pinLength,
                  ),
                ),
              ),
        ),
      );

  Widget _buildButtonContent(
    BuildContext context,
    bool showBiometricsButton,
    // bool hasFingerScan,
    // bool hasFaceScan,
    // bool biometricsEnabled,
    int pinLength,
    // String pin,
  ) {
    return RxBlocBuilder<PinCodeBlocType, int>(
        state: (bloc) => bloc.states.digitsCount,
        builder: (context, digitCount, bloc) {
          if (!showBiometricsButton && digitCount.data == pinLength) {
            return PinCodeDeleteKey(
              isLoading: isLoading,
              onTap: () => bloc.events.deleteDigit(),
            );
          } else if (showBiometricsButton) {
            return _buildEnableBiometricsButton(
              context,
              showBiometricsButton,
            );
          } else {
            return Opacity(
              opacity: isLoading ? 0.5 : 1,
              child: _buildIconContent(context, showBiometricsButton, pinLength,
                  digitCount.data ?? 0),
            );
          }
        });
  }

  Widget _buildIconContent(
    BuildContext context,
    bool showBiometricsButton,
    int pinLength,
    int pin,
  ) {
    if (pin > 0 && (pin < pinLength)) {
      if (widget.deleteKeyButton != null) {
        return widget.deleteKeyButton!;
      } else {
        return PinCodeDeleteKey(
          isLoading: isLoading,
          onTap: () => context.read<PinCodeBlocType>().events.deleteDigit(),
        );
      }
    } else if (pin == 0) {
      return Container();
    } else if (showBiometricsButton) {
      return _buildEnableBiometricsButton(
        context,
        showBiometricsButton,
      );
    }
    return Container();
  }

  Widget _buildEnableBiometricsButton(
    BuildContext context,
    bool showBiometricsButton,
  ) =>
      (showBiometricsButton)
          ? PinCodeBiometricKey(
              startWithAutoSubmit: false,
              isLoading: isLoading,
              onPressedDefault: (_) {
                // context
                //     .read<PinCodeBlocType>()
                //     .events
                //     .requestBiometricAuth(BiometricsMessage.notSetup.name);
                context
                    .read<PinCodeBlocType>()
                    .events
                    .biometricsButtonPressed(widget.localizedReason);
                context
                    .read<PinCodeBlocType>()
                    .events
                    .setBiometrics(true, 'Your biometrics are enabled!');
              },
            )
          : Container();

  /// endregion

  /// region Callbacks

  void _onStateChanged(BuildContext context, BiometricsMessage? message) {
    if (message == null) {
      return;
    }

    _showBiometricsMessageBottomSheet(
      context,
      message,
      _localizeMessage(message),
    );
  }

  String _localizeMessage(BiometricsMessage message) =>
      widget.mapBiometricMessageToString?.call(message) ?? message.translate();

  Future<void> _showBiometricsMessageBottomSheet(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  ) =>
      showBlurredBottomSheet(
        context: context,
        configuration: const ModalConfiguration(
          safeAreaBottom: false,
          showCloseButton: false,
        ),
        builder: (context) => Padding(
          padding: context.widgetToolkitTheme.mediumEdgeInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessagePanelWidget(
                message: localizedMessage,
                messageState: message.state(),
              ),
              Padding(
                padding:
                    context.widgetToolkitTheme.bottomSheetCloseButtonPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icons.close,
                      type: SmallButtonType.outline,
                      colorStyle: ButtonColorStyle.fromContext(
                        context,
                        activeGradientColorStart: context.widgetToolkitTheme
                            .disabledFilledButtonBackgroundColor,
                        activeGradientColorEnd:
                            context.widgetToolkitTheme.primaryGradientEnd,
                      ),
                    ),
                    if (message == BiometricsMessage.notSetup)
                      SmallButton(
                        onPressed: () {
                          AppSettings.openAppSettings(
                            type: AppSettingsType.security,
                          );
                          Navigator.of(context).pop();
                        },
                        icon: Icons.settings,
                        type: SmallButtonType.outline,
                        colorStyle: ButtonColorStyle.fromContext(
                          context,
                          activeGradientColorStart: context.widgetToolkitTheme
                              .disabledFilledButtonBackgroundColor,
                          activeGradientColorEnd:
                              context.widgetToolkitTheme.primaryGradientEnd,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
