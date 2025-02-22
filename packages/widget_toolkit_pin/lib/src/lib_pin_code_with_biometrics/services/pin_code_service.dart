abstract class PinCodeService {
  /// Receives the encrypted pinCode from user input.
  /// Returns the value verified by the server
  Future<dynamic> verifyPinCode(String pinCode);

  /// Returns the correct length from the backend,
  /// the length should be less than 10 digits
  Future<int> getPinLength();

  /// Encrypts the provided pin code and returns the encrypted string. It has a
  /// default implementation to return what is the input.
  Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);

  /// Returns the pin code or null if it is not saved in the device memory yet.
  Future<String?> getPinCode();

  /// Stores the encrypted pin code in the device secure storage.
  Future<bool> savePinCodeInSecureStorage(String pinCode);
}
