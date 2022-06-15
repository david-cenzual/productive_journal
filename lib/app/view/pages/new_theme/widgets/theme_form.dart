import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/constants/new_theme_constants.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/double_table_calendar.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form_date_form_field.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form_desciption_form_field.dart';
import 'package:productivejournal/app/view/pages/new_theme/widgets/theme_form_name_field.dart';
import 'package:productivejournal/app/view/pages/shared/helpers/ui_helpers.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';

class ThemeForm extends HookWidget {
  const ThemeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedInitialDayController = useTextEditingController();
    final selectedFinalDayController = useTextEditingController();
    final calendarStatus = useState(CalendarStatus.hidden);
    final numOfObjectives = useState(1);

    return BlocProvider<NewThemeBloc>(
      create: (context) => NewThemeBloc(),
      child: BlocBuilder<NewThemeBloc, NewThemeState>(
        builder: (context, state) {
          return Column(
            children: [
              ThemeNameFormField(state: state),
              if (hasDescriptionField.contains(state.status))
                ThemeDescriptionFormField(state: state),
              if (hasDateField.contains(state.status))
                ThemeDateFormField(
                  state: state,
                  calendarStatus: calendarStatus,
                  selectedInitialDayController: selectedInitialDayController,
                  selectedFinalDayController: selectedFinalDayController,
                ),
              DoubleTableCalendar(
                calendarStatus: calendarStatus,
                selectedInitialDayController: selectedInitialDayController,
                selectedFinalDayController: selectedFinalDayController,
              ),
              // if (hasObjectiveField.contains(state.status))
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: numOfObjectives.value,
                    itemBuilder: (_, __) {
                      return Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: const EdgeInsets.only(left: 30),
                              fillColor:
                                  Theme.of(context).colorScheme.background,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              suffixIcon: state.status ==
                                      NewThemeStatus.themeObjectivesLoading
                                  ? const LoadingWidget()
                                  : GestureDetector(
                                      onTap: () =>
                                          context.read<NewThemeBloc>().add(
                                                NewThemeNameSubmit(
                                                  name: state.sprint?.name,
                                                ),
                                              ),
                                      child: const Icon(
                                        Icons.play_circle_outline_sharp,
                                      ),
                                    ),
                              hintText: 'Specify an Objective of the Theme',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                            onChanged: (currentName) => context
                                .read<NewThemeBloc>()
                                .add(NewThemeNameChanged(name: currentName)),
                            // controller: nameController,
                          ),
                          UIHelper.smColumn,
                        ],
                      );
                    },
                  ),
                  InkWell(
                    onTap: () => numOfObjectives.value <= 5
                        ? numOfObjectives.value++
                        : null,
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: const Icon(
                        Icons.add_circle_outline_sharp,
                        size: 36,
                      ),
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
