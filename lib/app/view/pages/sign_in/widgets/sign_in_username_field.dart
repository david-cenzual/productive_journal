import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:productivejournal/app/view/pages/sign_in/constants/sign_in_constants.dart';
import 'package:productivejournal/bloc/sign_in_bloc/sign_in_bloc.dart';

class SignInUsernameField extends HookWidget {
  const SignInUsernameField({
    Key? key,
    required this.state,
  }) : super(key: key);

  final SignInState state;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController(
      text: context.read<SignInBloc>().state.username,
    );

    final hasFullBorder = loadingListStatus.contains(state);

    return TextFormField(
      decoration: InputDecoration(
        errorText: state.usernameError,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 30),
        fillColor: Theme.of(context).colorScheme.background,
        border: OutlineInputBorder(
          borderRadius: hasFullBorder
              ? const BorderRadius.all(Radius.circular(10))
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
        ),
        suffixIcon: state is SignInStateUserNameLoading
            ? const LoadingWidget()
            : GestureDetector(
                onTap: () => context
                    .read<SignInBloc>()
                    .add(SignInUsernameSubmit(username: state.username)),
                child: const Icon(Icons.play_circle_outline_sharp),
              ),
        hintText: 'Username',
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
      onChanged: (currentUsername) => context
          .read<SignInBloc>()
          .add(SignInUserameChanged(username: currentUsername)),
      controller: usernameController,
    );
  }
}
