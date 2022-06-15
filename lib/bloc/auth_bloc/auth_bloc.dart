import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    on<AuthStatusCheck>((event, emit) {
      switch (state.runtimeType) {
        case AuthStateUnknown:
          emit(const AuthState.authenticated(user: ''));
          //TODO RESTORE emit(const AuthState.unauthenticated());
          break;
        case AuthStateAuthenticated:
          emit(const AuthState.authenticated(user: ''));
          break;
        case AuthStateUnauthenticated:
          emit(const AuthState.authenticated(user: ''));
          //TODO RESTORE emit(const AuthState.unauthenticated());
          break;
      }
    });
  }
}
