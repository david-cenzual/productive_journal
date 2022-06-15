import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:productivejournal/app/view/pages/new_theme/constants/new_theme_constants.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';

class ThemeDateFormField extends HookWidget {
  const ThemeDateFormField({
    Key? key,
    required this.state,
    required this.selectedInitialDayController,
    required this.calendarStatus,
    required this.selectedFinalDayController,
  }) : super(key: key);

  final NewThemeState state;
  final TextEditingController selectedInitialDayController;
  final ValueNotifier<CalendarStatus> calendarStatus;
  final TextEditingController selectedFinalDayController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            controller: selectedInitialDayController,
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              border: const OutlineInputBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              hintText: 'Initial Date',
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
            onTap: () {
              switch (calendarStatus.value) {
                case CalendarStatus.end:
                  calendarStatus.value = CalendarStatus.start;
                  break;
                case CalendarStatus.start:
                  calendarStatus.value = CalendarStatus.hidden;
                  break;
                case CalendarStatus.hidden:
                  calendarStatus.value = CalendarStatus.start;
                  break;
              }
            },
          ),
        ),
        Flexible(
          child: TextFormField(
            controller: selectedFinalDayController,
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              border: const OutlineInputBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10)),
              ),
              suffixIcon: state.status == NewThemeStatus.themeDateLoading
                  ? const LoadingWidget(radius: 5)
                  : GestureDetector(
                      onTap: () {
                        calendarStatus.value = CalendarStatus.hidden;
                        context.read<NewThemeBloc>().add(
                              NewThemeDateSubmit(
                                startDate: state.sprint?.startDate,
                                endDate: state.sprint?.endDate,
                              ),
                            );
                      },
                      child: const Icon(Icons.play_circle_outline_sharp),
                    ),
              hintText: 'Ending Date',
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
            onTap: () {
              switch (calendarStatus.value) {
                case CalendarStatus.end:
                  calendarStatus.value = CalendarStatus.hidden;
                  break;
                case CalendarStatus.start:
                  calendarStatus.value = CalendarStatus.end;
                  break;
                case CalendarStatus.hidden:
                  calendarStatus.value = CalendarStatus.end;
                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}
