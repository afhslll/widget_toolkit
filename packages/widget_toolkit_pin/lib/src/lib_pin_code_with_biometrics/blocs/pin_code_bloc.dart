import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/error_enable_biometrics.dart';
import '../models/error_wrong_pin.dart';
import '../services/pin_biometrics_service.dart';
import '../services/pin_code_service.dart';

part 'pin_code_bloc.rxb.g.dart';

/// A contract class containing all events of the PinCodeBloc.
abstract class PinCodeBlocEvents {
  ///Triggered when user tap on the digit
  void addDigit(String digit);

  ///Triggered when user delete digit
  void deleteDigit();

  ///Triggered when user tap on biometrics button
  void biometricsButtonPressed(String reason);
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  ///Indicating how much dots to present
  Stream<int> get digitsCount;

  ///Indicating the biometrics button must be presented
  ConnectableStream<bool> get showBiometricsButton;

  ///Emits when user successfully authenticate (pin/biometrics)
  ConnectableStream<void> get authenticated;

  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;
}

@RxBloc()
class PinCodeBloc extends $PinCodeBloc {
  PinCodeBloc({
    required this.biometricAuthenticationService,
    required this.pinCodeService,
    required this.enterPinWithBiometrics,
  }) {
    authenticated.connect().addTo(_compositeSubscription);
    showBiometricsButton.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String enterPinWithBiometrics;

  final BehaviorSubject<String> _pinCode = BehaviorSubject.seeded('');
  final BehaviorSubject<bool> _pinAuth = BehaviorSubject.seeded(false);

  Future<bool> encryptAndVerify(String pinCode) async {
    final encryptedPin = await pinCodeService.encryptPinCode(pinCode);
    final verifiedPin = await pinCodeService.verifyPinCode(encryptedPin);
    return verifiedPin;
  }

  @override
  Stream<int> _mapToDigitsCountState() => Rx.merge([
        _$addDigitEvent.asyncMap((digit) async {
          final pinLength = await pinCodeService.getPinLength();
          if (_pinCode.value.length < pinLength) {
            _pinCode.add(_pinCode.value += digit);
          }
          return _pinCode.value.length;
        }),
        _$deleteDigitEvent.switchMap(
          (_) {
            _pinCode.add(_pinCode.value.substring(
                0, _pinCode.value.isNotEmpty ? _pinCode.value.length - 1 : 0));
            return Stream.value(_pinCode.value.length);
          },
        ),
      ]).startWith(0).share();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  ConnectableStream<void> _mapToAuthenticatedState() => Rx.merge([
        _$biometricsButtonPressedEvent.asyncMap((localizedReason) async {
          final result = await biometricAuthenticationService.enableBiometrics(
              true, localizedReason);

          if (result != null && result != BiometricsMessage.enabled) {
            throw ErrorEnableBiometrics(result);
          }
          await getAreBiometricsEnabled();
        }),
        _pinAuth.asResultStream(),
      ]).asResultStream().setResultStateHandler(this).whereSuccess().publish();

  Future<bool> getAreBiometricsEnabled() async {
    final isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    final canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    final biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    final pinCode = await pinCodeService.getPinCode();

    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  @override
  ConnectableStream<bool> _mapToShowBiometricsButtonState() => _digitsCountState
      .asyncMap((digitsCount) async {
        final storedPinLength = await pinCodeService.getPinLength();
        if (digitsCount == storedPinLength) {
          final isCorrectPin = await encryptAndVerify(_pinCode.value);
          if (isCorrectPin) {
            _pinAuth.add(true);
            return true;
          } else {
            _pinCode.value = '';
            throw ErrorWrongPin(errorMessage: 'Wrong Pin');
          }
        }
        return false;
      })
      .asResultStream()
      .setResultStateHandler(this)
      .whereSuccess()
      .publish();

  @override
  void dispose() {
    _pinAuth.close();
    _pinCode.close();
    super.dispose();
  }
}
