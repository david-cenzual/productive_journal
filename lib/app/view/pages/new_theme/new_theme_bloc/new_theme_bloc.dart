import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:productivejournal/domain/sprint/entities/objectives.dart';
import 'package:productivejournal/domain/sprint/entities/sprint.dart';
import 'package:productivejournal/infrastructure/infrastructure.dart';
import 'package:productivejournal/locator.dart';

part 'new_theme_event.dart';
part 'new_theme_state.dart';

final logs = locator<LoggerRepository>();

class NewThemeBloc extends Bloc<NewThemeEvent, NewThemeState> {
  NewThemeBloc() : super(NewThemeState.empty) {
    on<NewThemeNameChanged>(
      (event, emit) => emit(state.copyWith(name: event.name)),
    );
    on<NewThemeNameSubmit>((event, emit) async {
      emit(state.copyWith(newStatus: NewThemeStatus.themeNameLoading));
      await Future<void>.delayed(const Duration(seconds: 2));
      try {
        emit(
          state.copyWith(
            name: event.name,
            newStatus: NewThemeStatus.themeDescriptionActive,
          ),
        );
      } catch (error, stack) {
        logs.information(error: error, stack: stack);
        const errorMessage = 'Error key to send to localization';
        emit(
          state.copyWith(
            name: event.name,
            newStatus: NewThemeStatus.themeNameError,
            errorDescription: NewThemeErrorDescription(
              nameErrorDescription: errorMessage,
            ),
          ),
        );
      }
    });
    on<NewThemeDescriptionChanged>(
      (event, emit) => emit(state.copyWith(description: event.description)),
    );
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
    on<NewThemeDateChanged>(
      (event, emit) async => emit(
        state.copyWith(startDate: event.startDate, endDate: event.endDate),
      ),
    );
    on<NewThemeDateSubmit>((event, emit) async {
      emit(state.copyWith(newStatus: NewThemeStatus.themeDateLoading));
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          startDate: event.startDate,
          newStatus: NewThemeStatus.themeObjectivesActive,
        ),
      );
    });
  }
}
