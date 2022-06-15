part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState._({
    this.username,
    this.password,
    this.usernameError,
    this.passwordError,
    this.globalError,
  });

  const factory SignInState.initial() = SignInStateInitial;

  const factory SignInState.usernameLoading({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStateUserNameLoading;

  const factory SignInState.usernameActive({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStateUserNameActive;

  const factory SignInState.passwordLoading({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStatePasswordLoading;

  const factory SignInState.passwordActive({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStatePasswordActive;

  const factory SignInState.signInSubmitLoading({
    required String password,
    required String username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStateSubmitLoading;

  const factory SignInState.signInSubmitActive({
    required String password,
    required String username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) = SignInStateSubmitActive;

  final String? globalError;
  final String? username;
  final String? password;
  final String? usernameError;
  final String? passwordError;

  @override
  List<Object?> get props => [username, password, usernameError, passwordError];
}

class SignInStateInitial extends SignInState {
  const SignInStateInitial() : super._();
}

class SignInStateUserNameLoading extends SignInState {
  const SignInStateUserNameLoading({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}

class SignInStateUserNameActive extends SignInState {
  const SignInStateUserNameActive({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}

class SignInStatePasswordLoading extends SignInState {
  const SignInStatePasswordLoading({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}

class SignInStatePasswordActive extends SignInState {
  const SignInStatePasswordActive({
    String? password,
    String? username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}

class SignInStateSubmitLoading extends SignInState {
  const SignInStateSubmitLoading({
    required String password,
    required String username,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}

class SignInStateSubmitActive extends SignInState {
  const SignInStateSubmitActive({
    required String username,
    required String password,
    String? usernameError,
    String? passwordError,
    String? globalError,
  }) : super._(
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
          globalError: globalError,
        );
}
