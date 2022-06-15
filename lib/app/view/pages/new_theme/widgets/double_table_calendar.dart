import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:productivejournal/app/view/pages/new_theme/constants/new_theme_constants.dart';
import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';
import 'package:productivejournal/app/view/pages/shared/helpers/ui_helpers.dart';
import 'package:productivejournal/l10n/l10n.dart';
import 'package:table_calendar/table_calendar.dart';

class DoubleTableCalendar extends HookWidget {
  const DoubleTableCalendar({
    Key? key,
    required this.calendarStatus,
    required this.selectedFinalDayController,
    required this.selectedInitialDayController,
  }) : super(key: key);

  final ValueNotifier<CalendarStatus> calendarStatus;
  final TextEditingController selectedFinalDayController;
  final TextEditingController selectedInitialDayController;

  @override
  Widget build(BuildContext context) {
    final selectedInitialDay = useState<DateTime>(DateTime.now());
    final calendarFormat = useState<CalendarFormat>(CalendarFormat.month);
    final selectedFinalDay =
        useState<DateTime>(DateTime.now().add(const Duration(days: 1)));

    return Column(
      children: [
        const SizedBox(height: 10),
        if (calendarStatus.value == CalendarStatus.start)
          Container(
            key: const Key('initial_date'),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TableCalendar<DateTime>(
              headerStyle: HeaderStyle(
                formatButtonTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              calendarFormat: calendarFormat.value,
              focusedDay: selectedInitialDay.value,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              locale: AppLocalizations.of(context).localeName,
              selectedDayPredicate: (selectedDay) =>
                  selectedInitialDay.value == selectedDay,
              onDaySelected: (pressedDate, currentDate) {
                selectedInitialDay.value = pressedDate;
                if (selectedFinalDay.value.isBefore(pressedDate)) {
                  selectedFinalDay.value =
                      pressedDate.add(const Duration(days: 1));
                  selectedFinalDayController.text = DateFormat(
                    'dd MMM yyyy',
                    AppLocalizations.of(context).localeName,
                  )
                      .format(
                        pressedDate.add(const Duration(days: 1)),
                      )
                      .toLowerCase();
                }
                selectedInitialDayController.text = DateFormat(
                  'dd MMM yyyy',
                  AppLocalizations.of(context).localeName,
                ).format(pressedDate).toLowerCase();
                context.read<NewThemeBloc>().add(
                      NewThemeDateChanged(
                        startDate: selectedInitialDay.value,
                        endDate: selectedFinalDay.value,
                      ),
                    );
              },
              onFormatChanged: (nextFormat) =>
                  calendarFormat.value = nextFormat,
            ),
          ),
        if (calendarStatus.value == CalendarStatus.end)
          Container(
            key: const Key('end_date'),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TableCalendar<DateTime>(
              headerStyle: HeaderStyle(
                formatButtonTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                titleTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              calendarFormat: calendarFormat.value,
              focusedDay: selectedFinalDay.value,
              firstDay: selectedInitialDay.value,
              lastDay: DateTime.now().add(const Duration(days: 365)),
              locale: AppLocalizations.of(context).localeName,
              selectedDayPredicate: (selectedDay) =>
                  selectedFinalDay.value == selectedDay,
              onDaySelected: (pressedDate, currentDate) {
                selectedFinalDay.value = pressedDate;
                selectedFinalDayController.text = DateFormat(
                  'dd MMM yyyy',
                  AppLocalizations.of(context).localeName,
                ).format(pressedDate).toLowerCase();
                context.read<NewThemeBloc>().add(
                      NewThemeDateChanged(
                        startDate: selectedInitialDay.value,
                        endDate: selectedFinalDay.value,
                      ),
                    );
              },
              onFormatChanged: (nextFormat) =>
                  calendarFormat.value = nextFormat,
            ),
          ),
        UIHelper.smColumn,
      ],
    );
  }
}
