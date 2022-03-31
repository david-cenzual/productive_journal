import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';

class ThemeNameFormField extends HookWidget {
  const ThemeNameFormField({
    Key? key,
    required this.state,
  }) : super(key: key);

  final NewThemeState state;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(
      text: BlocProvider.of<NewThemeBloc>(context).state.sprint.name,
    );

    final isLoading = state.status == NewThemeStatus.initial ||
        state.status == NewThemeStatus.themeNameLoading ||
        state.status == NewThemeStatus.themeNameError;

    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        border: OutlineInputBorder(
          borderRadius: isLoading
              ? const BorderRadius.all(Radius.circular(10))
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
        ),
        suffixIcon: state.status == NewThemeStatus.themeNameLoading
            ? const LoadingWidget()
            : GestureDetector(
                onTap: () => context
                    .read<NewThemeBloc>()
                    .add(NewThemeNameSubmit(name: state.sprint.name)),
                child: const Icon(Icons.play_circle_outline_sharp),
              ),
        hintText: 'Theme name',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
      onChanged: (currentName) => context
          .read<NewThemeBloc>()
          .add(NewThemeNameChanged(name: currentName)),
      controller: nameController,
    );
  }
}
