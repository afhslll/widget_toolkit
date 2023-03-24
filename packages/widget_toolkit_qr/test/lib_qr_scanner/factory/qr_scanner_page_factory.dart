import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

/// Change the parameters according the needs of the test
Widget qrScannerPageFactory({
  bool? isLoading,
  Object? scannedValue,
  ErrorModel? errors,
  bool? hasCameraPermission,
}) =>
    Builder(
      builder: (context) => Scaffold(
        backgroundColor:
            context.qrScannerTheme.qrScannerPageScaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Container(
              color: context.qrScannerTheme.qrScannerPageBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: SizedBox(
                  height: 600,
                  width: 600,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: context.qrScannerTheme.qrScannerPage2,

                            ///TODO: REFACTORE HERE
                            // child: QrScannerWidget(
                            //   qrValidationService: null,
                            // ),
                            child: const SizedBox(),
                          ),
                        ),
                        _buildErrorModalSheetListener(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

Widget _buildErrorModalSheetListener(BuildContext context) =>
    RxBlocListener<QrScannerBlocType, Exception?>(
      state: (bloc) => bloc.states.errors,
      listener: (ctx, error) {
        showQrScannerErrorBottomModalSheet(
          context: context,
          headerWidget: const Text('QR Error bottom sheet'),
          error: error.toString(),
          retryButtonText: 'Retry',
        );
      },
    );
