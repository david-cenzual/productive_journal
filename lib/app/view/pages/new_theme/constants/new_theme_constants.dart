import 'package:productivejournal/app/view/pages/new_theme/new_theme_bloc/new_theme_bloc.dart';

enum CalendarStatus { start, end, hidden }

const hasDescriptionField = [
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

const hasDateField = [
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

const hasObjectiveField = [
  NewThemeStatus.themeActive,
  NewThemeStatus.themeError,
  NewThemeStatus.themeLoading,
  NewThemeStatus.themeObjectivesActive,
  NewThemeStatus.themeObjectivesLoading,
  NewThemeStatus.themeObjectivesError,
];

const hasCreateButton = [
  NewThemeStatus.themeActive,
  NewThemeStatus.themeError,
  NewThemeStatus.themeLoading,
];
