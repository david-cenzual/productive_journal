import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:productivejournal/domain/sprint/entities/objectives.dart';
import 'package:productivejournal/domain/sprint/entities/sprint.dart';

part 'new_theme_event.dart';
part 'new_theme_state.dart';

class NewThemeBloc extends Bloc<NewThemeEvent, NewThemeState> {
  NewThemeBloc() : super(NewThemeState.empty) {
    on<NewThemeNameChanged>((event, emit) {
      final currName = event.name;
      emit(state.copyWith(name: currName));
    });

    on<NewThemeNameSubmit>((event, emit) async {
      emit(state.copyWith(newStatus: NewThemeStatus.themeNameLoading));
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          name: event.name,
          newStatus: NewThemeStatus.themeDescriptionActive,
        ),
      );
    });

    on<NewThemeDescriptionChanged>((event, emit) {
      final currDesc = event.description;
      emit(state.copyWith(description: currDesc));
    });

    on<NewThemeDescriptionSubmit>((event, emit) async {
      emit(state.copyWith(newStatus: NewThemeStatus.themeDescriptionLoading));
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          name: event.description,
          newStatus: NewThemeStatus.themeDateActive,
        ),
      );
    });
  }
}
