import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:productivejournal/app/view/pages/shared/helpers/'
    'ui_helpers.dart';
import 'package:productivejournal/app/view/pages/sign_in/widgets/sign_in_'
    'password_field.dart';
import 'package:productivejournal/app/view/pages/sign_in/widgets/sign_in_'
    'username_field.dart';
import 'package:productivejournal/bloc/auth_bloc/auth_bloc.dart';
import 'package:productivejournal/bloc/sign_in_bloc/sign_in_bloc.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(context.read<AuthBloc>()),
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.mColumn,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/logo.jpg',
                      height: 80,
                      alignment: Alignment.centerLeft,
                    ),
                    UIHelper.smRow,
                    Column(
                      children: [
                        Text(
                          'Productive Journal',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                        UIHelper.smColumn,
                        Text(
                          'Authentication',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
                UIHelper.mColumn,
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    child: Column(
                      children: [
                        SignInUsernameField(state: state),
                        SignInPasswordField(state: state),
                        UIHelper.xl6Column,
                        ElevatedButton(
                          onPressed: () => context.read<SignInBloc>().add(
                                SignInLoginSubmit(
                                  username:
                                      context.read<SignInBloc>().state.username,
                                  password:
                                      context.read<SignInBloc>().state.password,
                                ),
                              ),
                          child: BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                              if (state is SignInStateSubmitLoading) {
                                return const CircularProgressIndicator();
                              } else {
                                return const SizedBox(child: Text('Login'));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
