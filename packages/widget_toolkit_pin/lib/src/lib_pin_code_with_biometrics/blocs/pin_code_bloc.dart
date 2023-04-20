import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';
import '../services/pin_biometrics_service.dart';
import '../services/pin_code_service.dart';

part 'pin_code_bloc.rxb.g.dart';

/// A contract class containing all events of the PinCodeBloc.
abstract class PinCodeBlocEvents {
  /// Checks whether the biometrics are enabled for the application
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkBiometricsEnabled();

  /// Checks whether there is a pin code stored in the device secure storage
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkPinCodeInStorage();

  /// Requests biometric authentication
  void requestBiometricAuth(String localizedMessage);

  /// This event is called when the user input pin code length reached the length
  /// set for the keyLength parameter in the PinCodeKeyboard widget
  void autoSubmit(String pin);

  /// When biometrics are not enable, this event is called with enabled true to
  /// enable the biometrics, the localizedReason is the message with a reason
  /// for enabling the biometrics displayed on the screen
  void setBiometrics(bool enabled, String localizedReason);
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  /// Returns true if the biometrics of the phone are enabled for usage from the app
  Stream<bool> get areBiometricsEnabled;

  /// Returns true is the pin code was verified by the API
  ConnectableStream<bool> get isPinCodeVerified;

  /// Returns list of available biometrics if the biometrics for the app are
  /// enabled, otherwise returns an empty list
  ConnectableStream<List<BiometricsAuthType>> get availableBiometrics;

  ConnectableStream<bool> get isAuthenticatedWithBiometrics;

  /// Message to be presented when biometrics setting are updated
  Stream<BiometricsMessage?> get biometricsDialog;

  /// Returns true if there is any pin code stored in device local secure storage
  ConnectableStream<bool> get isPinCodeInSecureStorage;

  /// The loading state
  Stream<bool> get isLoading;
}

@RxBloc()
class PinCodeBloc extends $PinCodeBloc {
  PinCodeBloc({
    required this.biometricAuthenticationService,
    required this.pinCodeService,
    required this.localizedBiometricsMessage,
  }) {
    checkPinCodeInStorage();
    checkBiometricsEnabled();
    isPinCodeInSecureStorage.connect().addTo(_compositeSubscription);
    isAuthenticatedWithBiometrics.connect().addTo(_compositeSubscription);
    isPinCodeVerified.connect().addTo(_compositeSubscription);
    availableBiometrics.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String localizedBiometricsMessage;

  @override
  ConnectableStream<bool> _mapToIsPinCodeInSecureStorageState() =>
      _$checkPinCodeInStorageEvent
          .switchMap((value) =>
              pinCodeService.isPinCodeInSecureStorage().asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          // .doOnData((event) {
        // print('IsPinCodeInSecureStorageBBLoc $event');
      // })
          .publishReplay(maxSize: 1);

  // }).publishReplay(maxSize: 1);

  @override
  Stream<bool> _mapToAreBiometricsEnabledState() =>
      _$checkBiometricsEnabledEvent
          .switchMap((value) {
            // print('checkBiometricsEnabledEvent');
            return getAreBiometricsEnabled().asResultStream();
          })
          .setResultStateHandler(this)
          .whereSuccess();
          // .doOnData((event) {
          //   print('AreBiometricsEnabledState4 $event');
          // });

  Future<bool> getAreBiometricsEnabled() async {
    var isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    var canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    var biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    // var pinCode = await pinCodeService.getPinCode();
    return isDeviceSupported && canCheckBiometrics && biometricsEnabled; //&&
    //pinCode != null;
  }

  @override
  ConnectableStream<List<BiometricsAuthType>>
      _mapToAvailableBiometricsState() =>
          biometricAuthenticationService.availableBiometrics
              .asResultStream()
              .setResultStateHandler(this)
              .whereSuccess()
              // .doOnData((event) {
            // print('availableBiometricsBloc: $event');
          // })
              .publish();

  @override
  ConnectableStream<bool> _mapToIsAuthenticatedWithBiometricsState() =>
      _$requestBiometricAuthEvent
          .switchMap(
              (value) => _biometricAuthentication(value).asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          // .doOnData((event) {
        // print('requestBiometricAuthBloc: $event ');
      // })
          .publishReplay(maxSize: 1);

  Future<bool> _biometricAuthentication(String localizedReason) async {
    var success = await biometricAuthenticationService.authenticate(
        localizedReason.isEmpty ? localizedBiometricsMessage : localizedReason);

    return success;
    // if (success) {
    // return await pinCodeService.getPinCode();
    // bool external = false; // todo check this
    // var t = isPinCodeVerified.listen((value) {
    //   print('internal1 $value');
    //   external = value;
    // });
    // await t.cancel();
    // return external;

    // return await pinCodeService.getPinCode();
    // }
    // return false;
  }

  @override
  ConnectableStream<bool> _mapToIsPinCodeVerifiedState() => _$autoSubmitEvent
      // .doOnData((pinCode) {
      //   print('beforeVerify: $pinCode');
      // })
      .switchMap((pinCode) {
        return encryptAndVerify(pinCode).asResultStream();
      })
      .setResultStateHandler(this)
      .whereSuccess()
      // .doOnData((event) {
      //   print('eventAfterVerify bool: $event');
      // })
      .publishReplay(maxSize: 1);

  Future<bool> encryptAndVerify(String pinCode) async {
    // Store the pin in device storage
    var g = await pinCodeService.encryptPinCode(pinCode);
    var t = await pinCodeService.verifyPinCode(g);
    return t;
  }

  @override
  Stream<BiometricsMessage?> _mapToBiometricsDialogState() =>
      _$setBiometricsEvent
          // .doOnData((event) {
          //   print('setBiometrics enabled3: ${event.enabled}  ');
          // })
          .switchMap((event) => biometricAuthenticationService
              .enableBiometrics(event.enabled, event.localizedReason)
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .doOnData((event) {
            if (event == BiometricsMessage.enabled) {
              checkBiometricsEnabled();
            }
          });

  @override
  Stream<bool> _mapToIsLoadingState() =>
      loadingState;//.distinct().doOnData((event) {
        // print('loadingStateBloc $event');
      // });
}
