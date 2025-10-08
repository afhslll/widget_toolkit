part of '../../../base/common_ui_components/rx_form_field_builder.dart';

typedef RxDateTimeFormFieldBuilderFunction<B extends RxBlocTypeBase> =
    Widget Function(RxDateTimeFormFieldBuilderState<B> fieldState);

class RxDateTimeFormFieldBuilder<B extends RxBlocTypeBase>
    extends RxFormFieldBuilder<B, DateTime?> {
  RxDateTimeFormFieldBuilder({
    required RxDateTimeFormFieldBuilderFunction<B> builder,
    required this.onChanged,
    required super.state,
    required super.showErrorState,
    super.key,
    super.bloc,
    this.inputType = DateTimeInputType.both,
    this.textController,
    this.decorationData = const RxInputDecorationData(),
    this.cursorBehaviour = RxTextFormFieldCursorBehaviour.start,
    this.dateFormat,
    this.showReset = false,
  }) : dateTimeFormBuilder = builder,
       super(builder: (_) => const SizedBox());
  final DateTimeInputType inputType;
  final RxFormFieldOnChanged<B, DateTime?> onChanged;
  final RxDateTimeFormFieldBuilderFunction<B> dateTimeFormBuilder;
  final TextEditingController? textController;
  final RxTextFormFieldCursorBehaviour cursorBehaviour;
  final RxInputDecorationData decorationData;
  final DateFormat? dateFormat;
  final bool showReset;

  @override
  RxDateTimeFormFieldBuilderState<B> createState() =>
      RxDateTimeFormFieldBuilderState<B>();
}

class RxDateTimeFormFieldBuilderState<B extends RxBlocTypeBase>
    extends
        RxFormFieldBuilderState<B, DateTime?, RxDateTimeFormFieldBuilder<B>> {
  late final TextEditingController textController =
      widget.textController ?? TextEditingController();

  late final DateTimeController controller = DateTimeController();

  late InputDecoration _decoration;
  InputDecoration get decoration => _decoration;

  late final bool _shouldDisposeController = widget.textController == null;

  bool showReset = false;

  @override
  void initState() {
    super.initState();

    assert(
      _blocState.isBroadcast,
      'state passed to [RxTextFormFieldBuilder], '
      'should be a broadcast stream',
    );

    controller.addListener(() {
      widget.onChanged(bloc, controller.value);
    });

    (_blocState)
        .listen((event) {
          controller.value = event;
          if (event == null) {
            textController.clear();
            setState(() {
              showReset = false;
            });
          } else if (_getFormattedDateTime(event) != textController.text) {
            setState(() {
              showReset = true && widget.showReset;
            });
            _onBlocStateEvent(_getFormattedDateTime(event));
          }
        }, onError: (exception) {})
        .addTo(_compositeSubscription);
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
    }
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _decoration = _makeDecoration(showError, error);
    return widget.dateTimeFormBuilder(this);
  }

  InputDecoration _makeDecoration(bool showError, String? error) =>
      InputDecoration(
        errorText: showError ? error : null,
        prefixIcon: Icon(
          widget.inputType == DateTimeInputType.time
              ? Icons.access_time
              : Icons.calendar_today,
        ),
        suffixIcon: showReset
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  controller.value = null;
                },
              )
            : null,
      );

  String _getFormattedDateTime(DateTime dateTime) {
    return widget.dateFormat?.format(dateTime) ??
        _getDefaultDateFormat().format(dateTime);
  }

  DateFormat _getDefaultDateFormat() {
    switch (widget.inputType) {
      case DateTimeInputType.time:
        return DateFormat.Hm();
      case DateTimeInputType.date:
        return DateFormat('dd MMM yyyy');
      case DateTimeInputType.both:
        return DateFormat.yMd().add_Hms();
    }
  }
}
