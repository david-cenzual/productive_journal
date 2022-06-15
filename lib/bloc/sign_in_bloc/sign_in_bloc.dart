import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productivejournal/app/view/pages/sign_in/functions/sign_in_impl.dart';
import 'package:productivejournal/bloc/auth_bloc/auth_bloc.dart';
import 'package:productivejournal/infrastructure/infrastructure.dart';
import 'package:productivejournal/locator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

final logs = locator<LoggerRepository>();

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.authBloc) : super(const SignInStateInitial()) {
    on<SignInUserameChanged>((event, emit) {
      emit(
        SignInState.usernameActive(
          username: event.username,
          password: state.password,
          usernameError: state.usernameError,
          passwordError: state.passwordError,
          globalError: state.globalError,
        ),
      );
    });
    on<SignInUsernameSubmit>((event, emit) async {
      emit(SignInState.usernameLoading(username: event.username));
      // Username Validation
      // If true DEFAULT
      const Duration(seconds: 2);
      emit(
        SignInState.passwordActive(
          username: state.username,
          password: '',
          passwordError: state.passwordError,
        ),
      );
      // If false
      // emit(
      //   SignInState.usernameActive(
      //     username: event.username,
      //     usernameError: event.usernameError,
      //   ),
      // );
    });
    on<SignInPasswordChanged>((event, emit) {
      emit(SignInState.passwordActive(password: event.password));
    });
    on<SignInPasswordSubmit>((event, emit) async {
      emit(SignInState.passwordLoading(password: event.password));
      // Password Validation
      // If true
      emit(
        SignInState.signInSubmitActive(
          username: state.username!,
          password: event.password!,
        ),
      );
      // If false
      // emit(SignInState.passwordActive(
      //   password: event.password,
      //   passwordError: event.passwordError,
      // ));
      // final login = {
      //   'user': state.username,
      //   'password': state.password,
      // };
      // final credentials = await LoginService().loginUser(login);
      // emit(state.copyWith(newStatus: SignInStatus.passwordAccepted));
    });

    on<SignInLoginSubmit>((event, emit) async {
      // If state has no password or username throw error
      if (state.password == null || state.username == null) {
        emit(
          SignInState.passwordActive(
            password: event.password,
            passwordError: 'Empty username or password provided',
          ),
        );
        return;
      }

      emit(
        SignInState.signInSubmitLoading(
          username: state.username ?? '',
          password: state.password ?? '',
        ),
      );

      final login = {
        'user': event.username,
        'password': event.password,
      };

      final credentials = await LoginService().loginUser(login);
      if (credentials != null) {
        authBloc.add(const AuthStatusCheck());
      } else {
        emit(
          SignInState.signInSubmitActive(
            password: state.password!,
            username: state.username!,
            passwordError: '',
            usernameError: '',
          ),
        );
      }
    });
  }

  final AuthBloc authBloc;
}
