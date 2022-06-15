part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInUserameChanged extends SignInEvent {
  const SignInUserameChanged({required this.username});
  final String? username;

  @override
  List<Object?> get props => [username];
}

class SignInUsernameSubmit extends SignInEvent {
  const SignInUsernameSubmit({required this.username, this.usernameError});
  final String? username;
  final String? usernameError;

  @override
  List<Object?> get props => [username, usernameError];
}

class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged({required this.password});
  final String? password;

  @override
  List<Object?> get props => [password];
}

class SignInPasswordSubmit extends SignInEvent {
  const SignInPasswordSubmit({required this.password, this.passwordError});
  final String? password;
  final String? passwordError;

  @override
  List<Object?> get props => [password, passwordError];
}

class SignInLoginSubmit extends SignInEvent {
  const SignInLoginSubmit({
    required this.username,
    required this.password,
    this.passwordError,
  });
  final String? username;
  final String? password;
  final String? passwordError;

  @override
  List<Object?> get props => [username, password, passwordError];
}
