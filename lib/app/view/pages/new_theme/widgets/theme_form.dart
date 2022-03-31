import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form_desciption_form_field.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form_name_field.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class ThemeForm extends StatelessWidget {
  const ThemeForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewThemeBloc>(
      create: (context) => NewThemeBloc(),
      child: BlocBuilder<NewThemeBloc, NewThemeState>(
        builder: (context, state) {
          final hasDescriptionField = [
            NewThemeStatus.themeDescriptionActive,
            NewThemeStatus.themeDescriptionLoading,
            NewThemeStatus.themeDescriptionError,
            NewThemeStatus.themeActive,
            NewThemeStatus.themeError,
            NewThemeStatus.themeLoading,
            NewThemeStatus.themeDateActive,
            NewThemeStatus.themeDateLoading,
            NewThemeStatus.themeDateError,
            NewThemeStatus.themeObjectivesActive,
            NewThemeStatus.themeObjectivesLoading,
            NewThemeStatus.themeObjectivesError,
          ];

          final hasDateField = [
            NewThemeStatus.themeActive,
            NewThemeStatus.themeError,
            NewThemeStatus.themeLoading,
            NewThemeStatus.themeDateActive,
            NewThemeStatus.themeDateLoading,
            NewThemeStatus.themeDateError,
            NewThemeStatus.themeObjectivesActive,
            NewThemeStatus.themeObjectivesLoading,
            NewThemeStatus.themeObjectivesError,
          ];

          final hasObjectiveField = [
            NewThemeStatus.themeActive,
            NewThemeStatus.themeError,
            NewThemeStatus.themeLoading,
            NewThemeStatus.themeObjectivesActive,
            NewThemeStatus.themeObjectivesLoading,
            NewThemeStatus.themeObjectivesError,
          ];

          final hasCreateButton = [
            NewThemeStatus.themeActive,
            NewThemeStatus.themeError,
            NewThemeStatus.themeLoading,
          ];

          return Column(
            children: [
              ThemeNameFormField(state: state),
              if (hasDescriptionField.contains(state.status))
                ThemeDescriptionFormField(state: state),
              //if (hasDateField.contains(state.status))
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: state.status ==
                                      NewThemeStatus.themeDateActive ||
                                  state.status ==
                                      NewThemeStatus.themeDateLoading ||
                                  state.status == NewThemeStatus.themeDateError
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                )
                              : BorderRadius.zero,
                        ),
                        hintText: 'Initial Date',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      // onTap: () async => TableCalendar(
                      //   context: context,
                      //   initialDateRange: DateTimeRange(
                      //     start: DateTime.now(),
                      //     end: DateTime(
                      //       DateTime.now().year,
                      //       DateTime.now().month,
                      //       DateTime.now().day + 1,
                      //     ),
                      //   ),
                      //   firstDate: DateTime.now(),
                      //   lastDate: DateTime(
                      //     DateTime.now().year + 4,
                      //     DateTime.now().month,
                      //     DateTime.now().day,
                      //   ),
                      // ),
                      onChanged: (_) => context
                          .read<NewThemeBloc>()
                          .add(NewThemeDescriptionChanged(description: _)),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: state.status ==
                                      NewThemeStatus.themeDateActive ||
                                  state.status ==
                                      NewThemeStatus.themeDateLoading ||
                                  state.status == NewThemeStatus.themeDateError
                              ? const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                )
                              : BorderRadius.zero,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        suffixIcon: state.status ==
                                NewThemeStatus.themeDateLoading
                            ? const LoadingWidget()
                            : GestureDetector(
                                onTap: () => context.read<NewThemeBloc>().add(
                                      NewThemeDescriptionSubmit(
                                        description: state.sprint.description,
                                      ),
                                    ),
                                child:
                                    const Icon(Icons.play_circle_outline_sharp),
                              ),
                        hintText: 'Ending Date',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      onChanged: (_) => context
                          .read<NewThemeBloc>()
                          .add(NewThemeDescriptionChanged(description: _)),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
