part of 'new_theme_bloc.dart';

enum NewThemeStatus {
  initial,
  themeNameLoading,
  themeNameError,
  themeDescriptionActive,
  themeDescriptionLoading,
  themeDescriptionError,
  themeDateActive,
  themeDateLoading,
  themeDateError,
  themeObjectivesActive,
  themeObjectivesLoading,
  themeObjectivesError,
  themeActive,
  themeLoading,
  themeError,
  themeDone,
}

class NewThemeState extends Equatable {
  const NewThemeState({
    required this.sprint,
    required this.status,
  });

  final Sprint sprint;
  final NewThemeStatus status;

  @override
  List<Object> get props => [sprint, status];

  static const empty = NewThemeState(
    sprint: Sprint(
      id: 0,
      name: '',
      description: '',
      startDate: '',
      endDate: '',
      objectives: [],
    ),
    status: NewThemeStatus.initial,
  );

  NewThemeState copyWith({
    int? id,
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    List<Objective>? objectives,
    NewThemeStatus? newStatus,
  }) {
    return NewThemeState(
      sprint: Sprint(
        id: id ?? sprint.id,
        name: name ?? sprint.name,
        description: description ?? sprint.description,
        startDate: startDate ?? sprint.startDate,
        endDate: endDate ?? sprint.endDate,
        objectives: objectives ?? sprint.objectives,
      ),
      status: newStatus ?? status,
    );
  }
}
