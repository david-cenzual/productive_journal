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

class NewThemeErrorDescription {
  NewThemeErrorDescription({
    this.nameErrorDescription,
    this.descriptionErrorDescription,
    this.dateErrorDescription,
    this.objectivesErrorDescription,
  });

  factory NewThemeErrorDescription.fromJson(Map<String, dynamic> json) {
    return NewThemeErrorDescription(
      nameErrorDescription: json['nameErrorDescription'] as String?,
      descriptionErrorDescription:
          json['descriptionErrorDescription'] as String?,
      dateErrorDescription: json['dateErrorDescription'] as String?,
      objectivesErrorDescription: json['objectivesErrorDescription'] as String?,
    );
  }

  final String? nameErrorDescription;
  final String? descriptionErrorDescription;
  final String? dateErrorDescription;
  final String? objectivesErrorDescription;

  Map<String, dynamic> toJson(
    NewThemeErrorDescription newThemeErrorDescription,
  ) {
    return <String, dynamic>{
      'nameErrorDescription': newThemeErrorDescription.nameErrorDescription,
      'descriptionErrorDescription':
          newThemeErrorDescription.descriptionErrorDescription,
      'dateErrorDescription': newThemeErrorDescription.dateErrorDescription,
      'objectivesErrorDescription':
          newThemeErrorDescription.objectivesErrorDescription,
    };
  }
}

class NewThemeState extends Equatable {
  const NewThemeState({
    this.sprint,
    this.errorDescription,
    required this.status,
  });

  final Sprint? sprint;
  final NewThemeStatus? status;
  final NewThemeErrorDescription? errorDescription;

  @override
  List<Object?> get props => [sprint, status, errorDescription];

  static const empty = NewThemeState(status: NewThemeStatus.initial);

  NewThemeState copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    List<Objective>? objectives,
    NewThemeStatus? newStatus,
    final NewThemeErrorDescription? errorDescription,
  }) {
    return NewThemeState(
      sprint: Sprint(
        id: id ?? sprint?.id,
        name: name ?? sprint?.name,
        description: description ?? sprint?.description,
        startDate: startDate ?? sprint?.startDate,
        endDate: endDate ?? sprint?.endDate,
        objectives: objectives ?? sprint?.objectives,
      ),
      status: newStatus ?? status,
      errorDescription: errorDescription ?? this.errorDescription,
    );
  }
}
