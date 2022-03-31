part of 'new_theme_bloc.dart';

@immutable
abstract class NewThemeEvent extends Equatable {
  const NewThemeEvent();

  @override
  List<Object> get props => [];
}

class NewThemeNameChanged extends NewThemeEvent {
  const NewThemeNameChanged({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [name];
}

class NewThemeNameSubmit extends NewThemeEvent {
  const NewThemeNameSubmit({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [name];
}

class NewThemeDescriptionChanged extends NewThemeEvent {
  const NewThemeDescriptionChanged({
    required this.description,
  });
  final String description;

  @override
  List<Object> get props => [description];
}

class NewThemeDescriptionSubmit extends NewThemeEvent {
  const NewThemeDescriptionSubmit({
    required this.description,
  });
  final String description;

  @override
  List<Object> get props => [description];
}
