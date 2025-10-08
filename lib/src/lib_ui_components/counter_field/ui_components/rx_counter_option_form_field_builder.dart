part of '../../../base/common_ui_components/rx_form_field_builder.dart';

typedef RxCounterOptionFormFieldBuilderFunction<B extends RxBlocTypeBase> =
    Widget Function(RxCounterOptionFormFieldBuilderState<B> fieldState);

class RxCounterOptionFormFieldBuilder<B extends RxBlocTypeBase>
    extends RxFormFieldBuilder<B, CounterOption> {
  RxCounterOptionFormFieldBuilder({
    required this.onChanged,
    required this.options,
    required super.state,
    required super.showErrorState,
    super.key,
    super.bloc,
    this.controller,
    this.decorationData = const RxInputDecorationData(),
    this.cursorBehaviour = RxTextFormFieldCursorBehaviour.start,
    this.labelText,
  }) : super(builder: (_) => const SizedBox());
  final RxFormFieldOnChanged<B, CounterOption> onChanged;
  final TextEditingController? controller;
  final RxTextFormFieldCursorBehaviour cursorBehaviour;
  final RxInputDecorationData decorationData;
  final List<String> options;
  final String? labelText;

  @override
  RxCounterOptionFormFieldBuilderState<B> createState() =>
      RxCounterOptionFormFieldBuilderState<B>();
}

class RxCounterOptionFormFieldBuilderState<B extends RxBlocTypeBase>
    extends
        RxFormFieldBuilderState<
          B,
          CounterOption,
          RxCounterOptionFormFieldBuilder<B>
        > {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  late InputDecoration _decoration;
  InputDecoration get decoration => _decoration;

  late final bool _shouldDisposeController = widget.controller == null;

  @override
  void initState() {
    super.initState();

    assert(
      _blocState.isBroadcast,
      'state passed to [RxTextFormFieldBuilder], '
      'should be a broadcast stream',
    );
    assert(
      widget.options.isNotEmpty,
      'options passed to [RxCounterOptionFormFieldBuilder] should not be empty',
    );

    _value = CounterOption(total: 0, label: widget.options.first);

    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        final newTotal = int.tryParse(controller.text) ?? 0;
        if (newTotal == 0) {
          controller.clear();
        }
        if (newTotal != _value!.total) {
          widget.onChanged(bloc, _value!.copyWith(total: newTotal));
        }
        _value = _value!.copyWith(total: newTotal);
      }
    });

    (_blocState as Stream<CounterOption>)
        .where(
          (event) =>
              event.total != (int.tryParse(controller.text) ?? 0) ||
              event.total != _value?.total,
        )
        .listen((event) {
          _onBlocStateEvent(event.total.toString());
        }, onError: (exception) {})
        .addTo(_compositeSubscription);
  }

  void _onBlocStateEvent(String newValue) {
    switch (widget.cursorBehaviour) {
      case RxTextFormFieldCursorBehaviour.start:
        controller.text = newValue;
        break;
      case RxTextFormFieldCursorBehaviour.preserve:
        controller.value = TextEditingValue(
          text: newValue,
          selection: newValue.length < controller.value.selection.end
              ? TextSelection.collapsed(offset: newValue.length)
              : controller.value.selection,
          composing: TextRange.empty,
        );
        break;
      case RxTextFormFieldCursorBehaviour.end:
        controller.value = TextEditingValue(
          text: newValue,
          selection: TextSelection.collapsed(offset: newValue.length),
          composing: TextRange.empty,
        );
        break;
    }
  }

  @override
  void dispose() {
    if (_shouldDisposeController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final borderRadius =
        (inputTheme.border as OutlineInputBorder?)?.borderRadius ??
        BorderRadius.circular(8.0);

    _decoration = _makeDecoration(showError, error);
    return IntrinsicHeight(
      child: Row(
        spacing: (inputTheme.contentPadding?.horizontal ?? 32.0) / 2,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: _decoration,
              onTapOutside: (e) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
          InkWell(
            onTap: () {
              if (_value == null) return;
              final currentIndex = widget.options.indexOf(_value!.label);
              final nextIndex = (currentIndex + 1) % widget.options.length;
              _value = _value!.copyWith(label: widget.options[nextIndex]);
              widget.onChanged(bloc, _value!);
            },
            borderRadius: borderRadius,
            child: Container(
              constraints: BoxConstraints(minWidth: 100),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color:
                      inputTheme.enabledBorder?.borderSide.color ?? Colors.grey,
                ),
              ),
              child: Center(
                child: Text(_value?.label ?? '', style: inputTheme.labelStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _makeDecoration(bool showError, String? error) =>
      InputDecoration(
        labelText: widget.labelText,
        prefixIcon: IconButton(
          onPressed: () {
            final newValue = _value!.total - 1;
            widget.onChanged(bloc, _value!.copyWith(total: newValue));
          },
          icon: widget.decorationData.iconCounterDecrement,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            final newValue = _value!.total + 1;
            widget.onChanged(bloc, _value!.copyWith(total: newValue));
          },
          icon: widget.decorationData.iconCounterIncrement,
        ),
        errorText: showError ? error : null,
      );
}
