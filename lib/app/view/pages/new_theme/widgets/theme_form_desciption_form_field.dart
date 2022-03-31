import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';

class ThemeDescriptionFormField extends HookWidget {
  const ThemeDescriptionFormField({
    Key? key,
    required this.state,
  }) : super(key: key);

  final NewThemeState state;

  @override
  Widget build(BuildContext context) {
    final descriptionController = useTextEditingController(
      text: BlocProvider.of<NewThemeBloc>(context).state.sprint.description,
    );

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: state.status == NewThemeStatus.themeDescriptionActive ||
                  state.status == NewThemeStatus.themeDescriptionLoading ||
                  state.status == NewThemeStatus.themeDescriptionError
              ? const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : BorderRadius.zero,
        ),
        suffixIcon: state.status == NewThemeStatus.themeDescriptionLoading
            ? const LoadingWidget()
            : GestureDetector(
                onTap: () => context.read<NewThemeBloc>().add(
                      NewThemeDescriptionSubmit(
                        description: state.sprint.description,
                      ),
                    ),
                child: const Icon(
                  Icons.play_circle_outline_sharp,
                ),
              ),
        hintText: 'Theme description',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
      onChanged: (_) {
        context
            .read<NewThemeBloc>()
            .add(NewThemeDescriptionChanged(description: _));
      },
      controller: descriptionController,
    );
  }
}
