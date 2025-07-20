// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get appName => 'ExamApp';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get enterEmailForgetPassword =>
      'Please enter your email associated to your account';

  @override
  String get emailVerification => 'Email verification';

  @override
  String get enterCode =>
      'Please enter the code that was sent to your email address';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get passwordValidation =>
      'Password must not be empty and must contain at least 6 characters, including one uppercase letter and one number';

  @override
  String get newPassword => 'New password';

  @override
  String get enterNewPassword => 'ُEnter new Password';

  @override
  String get continueButton => 'Continue';

  @override
  String get signUp => 'Sign up';

  @override
  String get userName => 'User name';

  @override
  String get enterUserName => 'Enter your user name';

  @override
  String get firstName => 'First name';

  @override
  String get enterFirstName => 'Enter first name';

  @override
  String get lastName => 'Last name';

  @override
  String get enterLastName => 'Enter last name';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get emailInvalid => 'This Email is not valid';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get enterConfirmPassword => 'Confirm password';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get signupButton => 'Signup';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordNotValid => 'Password not valid';

  @override
  String get userNameRequired => 'User name is required';

  @override
  String get firstNameRequired => 'First name is required';

  @override
  String get lastNameRequired => 'Last name is required';

  @override
  String get phoneRequired => 'Phone number is required';
}
