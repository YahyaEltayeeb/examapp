import 'package:examapp/domain/useCase/save_exam_result_use_case.dart';
import 'package:examapp/view_model/save_result_bloc/save_result_event.dart';
import 'package:examapp/view_model/save_result_bloc/save_result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveExamBloc extends Bloc<SaveResultEvent, SaveExamState> {
  final SaveExamResultUseCase useCase;

  SaveExamBloc(this.useCase) : super(SaveExamState()) {
    on<SaveExamResultEvent>(_onSave);
  }

  Future<void> _onSave(
    SaveExamResultEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isSaving: true));
    try {
      await useCase(event.exam);
      emit(state.copyWith(isSaving: false, success: true));
    } catch (e) {
      emit(state.copyWith(isSaving: false, error: e.toString()));
    }
  }
}
