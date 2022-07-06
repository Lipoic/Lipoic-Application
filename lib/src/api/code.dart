// ignore_for_file: constant_identifier_names

/// Lipoic API response code.
/// Also see https://api-docs.lipoic.org/router/data/code/struct.Code.html
enum Code {
  /// OK.
  OK(200),

  /// Resource not found.
  NotFound(404),

  /// OAuth auth code error.
  OAuthCodeError(1),

  /// OAuth get user info error.
  OAuthGetUserInfoError(2),

  /// User not found error.
  LoginUserNotFoundError(3),

  /// Input password error.
  LoginPasswordError(4),

  /// This email is already registered.
  SignUpEmailAlreadyRegistered(5),

  /// This code is invalid.
  VerifyEmailError(6),

  /// This token is invalid.
  AuthError(7);

  const Code(this.value);
  final int value;
}
