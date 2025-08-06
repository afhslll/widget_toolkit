import 'package:mockito/annotations.dart';

import '../../../helpers/golden_helper.dart';
import '../factory/sms_code_field_factory.dart';
import '../stubs.dart';

@GenerateMocks([])
void main() {
  runGoldenTests([
    buildScenario(
      scenario: 'sms_code_field_empty',
      widget: smsCodeFieldFactory(
        key: Stubs.smsCodeFieldKey,
        obscureText: true,
        controller: Stubs.controllerEmpty,
        pinLength: 6,
      ),
    ),
    buildScenario(
      widget: smsCodeFieldFactory(
        key: Stubs.smsCodeFieldKey,
        obscureText: true,
        controller: Stubs.controllerFourDigits,
        pinLength: 6,
      ),
      scenario: 'sms_code_field_inProgress',
    ),
    buildScenario(
      widget: smsCodeFieldFactory(
        key: Stubs.smsCodeFieldKey,
        obscureText: true,
        controller: Stubs.controllerFourDigits,
        pinLength: 4,
        autoValidate: true,
      ),
      scenario: 'sms_code_field_4_digit_success',
    ),
    buildScenario(
      widget: smsCodeFieldFactory(
        key: Stubs.smsCodeFieldKey,
        obscureText: false,
        controller: Stubs.controllerSixDigits,
        pinLength: 6,
        autoValidate: true,
      ),
      scenario: 'sms_code_field_success_non_obscured',
    ),
    buildScenario(
      widget: smsCodeFieldFactory(
        key: Stubs.smsCodeFieldKey,
        obscureText: true,
        controller: Stubs.controllerSixDigits,
        pinLength: 6,
        validator: (_, __) => 'An error occur!',
        autoValidate: true,
        forceErrorState: true,
      ),
      scenario: 'sms_code_field_error',
    ),
  ]);
}
