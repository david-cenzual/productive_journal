part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStatusChanges extends AuthEvent {
  const AuthStatusChanges({this.user});

  final String? user;

  @override
  List<Object?> get props => [user];
}

class AuthStatusCheck extends AuthEvent {
  const AuthStatusCheck();

  @override
  List<Object?> get props => [];
}
