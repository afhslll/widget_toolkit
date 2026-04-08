import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';

const _transparent = Color(0x00ffffff);

class ToolkitButton extends StatefulWidget {
  const ToolkitButton({
    super.key,
    required this.text,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.style,
    this.state = ToolkitButtonState.enabled,
  });

  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final ToolkitButtonStyle? style;
  final ToolkitButtonState state;
  final VoidCallback? onPressed;

  factory ToolkitButton.outlined(
    BuildContext context, {
    required String text,
    VoidCallback? onPressed,
    IconData? leadingIcon,
    IconData? trailingIcon,
    ToolkitButtonStyle? style,
    ToolkitButtonState state = ToolkitButtonState.enabled,
  }) {
    return ToolkitButton(
      text: text,
      onPressed: onPressed,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      style:
          style ??
          ToolkitButtonStyle(
            backgroundColor: context.widgetToolkitTheme.colors.primaryContainer,
            foregroundColor:
                context.widgetToolkitTheme.colors.onPrimaryContainer,
            borderColor: context.widgetToolkitTheme.colors.onPrimaryContainer,
            elevation: 0.0,
          ),
      state: state,
    );
  }

  @override
  State<ToolkitButton> createState() => _ToolkitButtonState();
}

class _ToolkitButtonState extends State<ToolkitButton> {
  final WidgetStatesController _statesController = WidgetStatesController();
  late WidgetStateProperty<Matrix4> _transform;
  late WidgetStateProperty<Duration> _duration;
  late WidgetStateProperty<Curve> _curve;
  WidgetStateProperty<Gradient>? _gradient;

  @override
  void initState() {
    _duration = WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.pressed)) {
        return const Duration(milliseconds: 200);
      }
      return const Duration(milliseconds: 500);
    });
    _transform = WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.pressed)) {
        return Matrix4.identity()..scale(0.95);
      }
      return Matrix4.identity();
    });
    _curve = WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.pressed)) {
        return Curves.easeOut;
      }
      return Curves.bounceOut;
    });

    final style = widget.style;
    if (style?.startGradientColor != null && style?.endGradientColor != null) {
      _gradient = WidgetStatePropertyAll(
        LinearGradient(
          colors: [style!.startGradientColor!, style.endGradientColor!],
        ),
      );
    }
    _updateButtonState();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToolkitButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      _updateButtonState();
    }
  }

  void _updateButtonState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final states = Set<WidgetState>.from(_statesController.value);
      if (widget.state == ToolkitButtonState.enabled) {
        states.remove(WidgetState.disabled);
      } else {
        states.add(WidgetState.disabled);
      }
      _statesController.value = states;
    });
  }

  ButtonStyle _fallbackStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return widget.style?.disabledBackgroundColor ??
              context.widgetToolkitTheme.buttonDisabledBackgroundColor;
        }
        return widget.style?.backgroundColor ??
            context.widgetToolkitTheme.buttonBackgroundColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return widget.style?.disabledForegroundColor ??
              context.widgetToolkitTheme.buttonDisabledForegroundColor;
        }
        return widget.style?.foregroundColor ??
            context.widgetToolkitTheme.buttonForegroundColor;
      }),
      elevation: WidgetStateProperty.resolveWith((state) {
        final elevation =
            widget.style?.elevation ??
            context.widgetToolkitTheme.buttonElevation;
        if (state.contains(WidgetState.disabled)) {
          return 0.0;
        } else if (state.contains(WidgetState.pressed)) {
          return elevation / 2;
        }
        return elevation;
      }),
      shadowColor: WidgetStatePropertyAll(
        widget.style?.shadowColor ??
            context.widgetToolkitTheme.buttonShadowColor,
      ),
    );
  }

  ButtonStyle _noBackgroundStyle(BuildContext context) {
    return _fallbackStyle(context).copyWith(
      backgroundColor: WidgetStateProperty.all(_transparent),
      shadowColor: WidgetStateProperty.all(_transparent),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  BoxDecoration _resolveDecoration(
    BuildContext context,
    Set<WidgetState> value,
  ) {
    final buttonStyle = _fallbackStyle(context);
    BoxShape shape = BoxShape.rectangle;
    BorderRadius borderRadius = BorderRadius.circular(
      widget.style?.borderRadius ??
          context.widgetToolkitTheme.buttonBorderRadius,
    );
    BoxShadow? shadow;
    final elevation = buttonStyle.elevation?.resolve(value);
    if (elevation != null && elevation > 0) {
      shadow = BoxShadow(
        color:
            buttonStyle.shadowColor?.resolve(value)?.withAlpha(100) ??
            Theme.of(context).shadowColor,
        offset: Offset(0, elevation / 1.5),
        blurRadius: elevation,
        spreadRadius: 0,
        blurStyle: BlurStyle.normal,
      );
    }

    return BoxDecoration(
      color: buttonStyle.backgroundColor?.resolve(value),
      gradient: _gradient?.resolve(value),
      shape: shape,
      borderRadius: borderRadius,
      border: BoxBorder.all(
        color:
            widget.style?.borderColor ??
            context.widgetToolkitTheme.buttonBorderColor,
      ),
      boxShadow: shadow != null ? [shadow] : null,
    );
  }

  Widget _child(BuildContext context) {
    return Padding(
      padding:
          widget.style?.padding ?? context.widgetToolkitTheme.buttonPadding,
      child: widget.state == ToolkitButtonState.loading
          ? SizedBox(
              width: double.infinity,
              height:
                  widget.style?.iconSize ??
                  context.widgetToolkitTheme.buttonIconSize,
              child: Center(
                child: SizedLoadingIndicator.textButtonValue(
                  color:
                      widget.style?.disabledForegroundColor ??
                      context.widgetToolkitTheme.buttonDisabledForegroundColor,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.leadingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      widget.leadingIcon,
                      size:
                          widget.style?.iconSize ??
                          context.widgetToolkitTheme.buttonIconSize,
                    ),
                  ),
                Text(
                  widget.text,
                  style:
                      (widget.style?.textStyle ??
                              context.widgetToolkitTheme.buttonTextStyle)
                          .copyWith(height: 0),
                ),
                if (widget.trailingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      widget.trailingIcon,
                      size:
                          widget.style?.iconSize ??
                          context.widgetToolkitTheme.buttonIconSize,
                    ),
                  ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<WidgetState>>(
      valueListenable: _statesController,
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: _duration.resolve(value),
          curve: _curve.resolve(value),
          transform: _transform.resolve(value),
          transformAlignment: Alignment.center,
          decoration: _resolveDecoration(context, value),
          child: child,
        );
      },
      child: ElevatedButton(
        key: widget.key,
        onPressed:
            widget.state == ToolkitButtonState.disabled ||
                widget.state == ToolkitButtonState.loading
            ? null
            : widget.onPressed,
        statesController: _statesController,
        style: _noBackgroundStyle(context),
        child: _child(context),
      ),
    );
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }
}
