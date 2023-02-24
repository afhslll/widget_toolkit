import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:rx_bloc/rx_bloc.dart';

import '../models/common/message_panel_state.dart';
import '../models/errors/error_model.dart';
import 'app_message_panel_widget.dart';

typedef ErrorStateCallback<BlocType extends RxBlocTypeBase>
    = Stream<ErrorModel?> Function(BlocType bloc);

class AppMessagePanelError<BlocType extends RxBlocTypeBase>
    extends StatelessWidget {
  const AppMessagePanelError({
    required this.errorState,
    this.errorPanelIcon,
    this.padding = EdgeInsets.zero,
    this.errorBuilder,
    this.messageState = MessagePanelState.important,
    Key? key,
  }) : super(key: key);

  final ErrorStateCallback<BlocType> errorState;
  final EdgeInsets padding;
  final Widget Function(ErrorModel?)? errorBuilder;
  final MessagePanelState messageState;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<BlocType, ErrorModel?>(
        state: (bloc) => errorState(bloc),
        builder: (context, snapshot, bloc) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: snapshot.data == null
              ? const SizedBox()
              : Padding(
                  padding: padding,
                  child: errorBuilder?.call(snapshot.data) ??
                      AppMessagePanelWidget(
                        message: snapshot.data.toString(),
                        messageState: messageState,
                        errorPanelIcon: errorPanelIcon,
                      ),
                ),
        ),
      );
}
