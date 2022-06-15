import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:productivejournal/bloc/auth_bloc/auth_bloc.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<AuthBloc>(context).add(const AuthStatusCheck());
    });

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        listener: (context, state) {
          switch (state.runtimeType) {
            case AuthStateUnknown:
              Beamer.of(context).beamToNamed('/sign_in');
              break;
            case AuthStateUnauthenticated:
              Beamer.of(context).beamToNamed('/sign_in');
              break;
            case AuthStateAuthenticated:
              Beamer.of(context).beamToNamed('/home');
              break;
            default:
              Beamer.of(context).beamToNamed('/sign_in');
              break;
          }
        },
        builder: (context, state) => const Center(child: LoadingWidget()),
      ),
    );
  }
}
