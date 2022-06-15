part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({this.user});

  const factory AuthState.unknown({String? user}) = AuthStateUnknown;
  const factory AuthState.authenticated({required String? user}) =
      AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;

  final String? user;

  @override
  List<Object?> get props => [user];
}

class AuthStateUnknown extends AuthState {
  const AuthStateUnknown({String? user}) : super._(user: user);
}

class AuthStateAuthenticated extends AuthState {
  const AuthStateAuthenticated({required String? user}) : super._(user: user);
}

class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated() : super._();
}
