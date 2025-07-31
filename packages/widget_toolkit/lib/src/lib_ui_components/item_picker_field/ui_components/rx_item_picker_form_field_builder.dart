part of '../../../base/common_ui_components/rx_form_field_builder.dart';

typedef RxItemPickerFormFieldBuilderFunction<B extends RxBlocTypeBase,
        T extends PickerItemModel>
    = Widget Function(RxItemPickerFormFieldBuilderState<B, T> fieldState);

class RxItemPickerFormFieldBuilder<B extends RxBlocTypeBase,
    T extends PickerItemModel> extends RxFormFieldBuilder<B, List<T>> {
  RxItemPickerFormFieldBuilder({
    required RxItemPickerFormFieldBuilderFunction<B, T> builder,
    required this.onChanged,
    required super.state,
    required super.showErrorState,
    super.key,
    super.bloc,
    this.textController,
    this.decorationData = const RxInputDecorationData(),
    this.cursorBehaviour = RxTextFormFieldCursorBehaviour.start,
  })  : itemPickerFormBuilder = builder,
        super(
          builder: (_) => const SizedBox(),
        );

  final RxFormFieldOnChanged<B, List<T>> onChanged;
  final RxItemPickerFormFieldBuilderFunction<B, T> itemPickerFormBuilder;
  final TextEditingController? textController;
  final RxTextFormFieldCursorBehaviour cursorBehaviour;
  final RxInputDecorationData decorationData;

  @override
  RxItemPickerFormFieldBuilderState<B, T> createState() =>
      RxItemPickerFormFieldBuilderState<B, T>();
}

class RxItemPickerFormFieldBuilderState<B extends RxBlocTypeBase,
        T extends PickerItemModel>
    extends RxFormFieldBuilderState<B, List<T>,
        RxItemPickerFormFieldBuilder<B, T>> {
  late final TextEditingController textController =
      widget.textController ?? TextEditingController();

  late final ItemPickerController<T> controller = ItemPickerController();

  late InputDecoration _decoration;
  InputDecoration get decoration => _decoration;

  late final bool _shouldDisposeController = widget.textController == null;
  final _controllerValueStream = BehaviorSubject<List<T>>();

  @override
  void initState() {
    super.initState();

    assert(
      _blocState.isBroadcast,
      'state passed to [RxTextFormFieldBuilder], '
      'should be a broadcast stream',
    );

    controller.addListener(() {
      _controllerValueStream.add(controller.value);
    });

    _controllerValueStream
        .distinct()
        .listen((event) => widget.onChanged(bloc, event))
        .addTo(_compositeSubscription);

    (_blocState as Stream<List<T>>).listen(
      (event) {
        controller.value = event;
        _onBlocStateEvent(event.map((e) => e.itemDisplayName).join(', '));
      },
      onError: (exception) {},
    ).addTo(_compositeSubscription);
  }

  void _onBlocStateEvent(String newValue) {
    switch (widget.cursorBehaviour) {
      case RxTextFormFieldCursorBehaviour.start:
        textController.text = newValue;
        break;
      case RxTextFormFieldCursorBehaviour.preserve:
        textController.value = TextEditingValue(
          text: newValue,
          selection: newValue.length < textController.value.selection.end
              ? TextSelection.collapsed(offset: newValue.length)
              : textController.value.selection,
          composing: TextRange.empty,
        );
        break;
      case RxTextFormFieldCursorBehaviour.end:
        textController.value = TextEditingValue(
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
      textController.dispose();
      controller.dispose();
    }
    _controllerValueStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _decoration = _makeDecoration(showError, error);
    return widget.itemPickerFormBuilder(this);
  }

  InputDecoration _makeDecoration(bool showError, String? error) =>
      InputDecoration(
        errorText: showError ? error : null,
        suffixIcon: Icon(Icons.keyboard_arrow_down),
      );
}
