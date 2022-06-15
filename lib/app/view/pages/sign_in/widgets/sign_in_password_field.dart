import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:productivejournal/bloc/sign_in_bloc/sign_in_bloc.dart';

class SignInPasswordField extends HookWidget {
  const SignInPasswordField({
    Key? key,
    required this.state,
  }) : super(key: key);

  final SignInState state;

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController(
      text: context.read<SignInBloc>().state.password,
    );

    return TextFormField(
      decoration: InputDecoration(
        errorText: state.passwordError,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 30),
        fillColor: Theme.of(context).colorScheme.background,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        suffixIcon: state is SignInStatePasswordLoading
            ? const LoadingWidget()
            : GestureDetector(
                onTap: () => context
                    .read<SignInBloc>()
                    .add(SignInPasswordSubmit(password: state.password)),
                child: const Icon(Icons.play_circle_outline_sharp),
              ),
        hintText: 'Name of the theme',
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
      onChanged: (currentPassword) => context
          .read<SignInBloc>()
          .add(SignInPasswordChanged(password: currentPassword)),
      controller: passwordController,
    );
  }
}
