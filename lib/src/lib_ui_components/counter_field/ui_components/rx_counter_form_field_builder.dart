part of '../../../base/common_ui_components/rx_form_field_builder.dart';

typedef RxCounterFormFieldBuilderFunction<B extends RxBlocTypeBase> =
    Widget Function(RxCounterFormFieldBuilderState<B> fieldState);

class RxCounterFormFieldBuilder<B extends RxBlocTypeBase>
    extends RxFormFieldBuilder<B, int> {
  RxCounterFormFieldBuilder({
    required RxCounterFormFieldBuilderFunction<B> builder,
    required this.onChanged,
    required super.state,
    required super.showErrorState,
    super.key,
    super.bloc,
    this.controller,
    this.decorationData = const RxInputDecorationData(),
    this.cursorBehaviour = RxTextFormFieldCursorBehaviour.start,
  }) : counterFormBuilder = builder,
       super(builder: (_) => const SizedBox());
  final RxFormFieldOnChanged<B, int> onChanged;
  final RxCounterFormFieldBuilderFunction<B> counterFormBuilder;
  final TextEditingController? controller;
  final RxTextFormFieldCursorBehaviour cursorBehaviour;
  final RxInputDecorationData decorationData;

  @override
  RxCounterFormFieldBuilderState<B> createState() =>
      RxCounterFormFieldBuilderState<B>();
}

class RxCounterFormFieldBuilderState<B extends RxBlocTypeBase>
    extends RxFormFieldBuilderState<B, int, RxCounterFormFieldBuilder<B>> {
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

    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        final newValue = int.tryParse(controller.text) ?? 0;
        if (newValue == 0) {
          controller.clear();
        }
        if (newValue != _value) {
          widget.onChanged(bloc, newValue);
        }
        _value = newValue;
      }
    });

    (_blocState as Stream<int>)
        .where((event) => event != (int.tryParse(controller.text) ?? 0))
        .listen((event) {
          _onBlocStateEvent(event.toString());
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
    _decoration = _makeDecoration(showError, error);
    return widget.counterFormBuilder(this);
  }

  InputDecoration _makeDecoration(bool showError, String? error) =>
      InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {
            final newValue = (_value ?? 0) - 1;
            widget.onChanged(bloc, newValue);
          },
          icon: widget.decorationData.iconCounterDecrement,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            final newValue = (_value ?? 0) + 1;
            widget.onChanged(bloc, newValue);
          },
          icon: widget.decorationData.iconCounterIncrement,
        ),
        errorText: showError ? error : null,
      );
}
