class SaveExamState {
  final bool isSaving;
  final bool success;
  final String error;

  SaveExamState({
    this.isSaving = false,
    this.success = false,
    this.error = '',
  });

  SaveExamState copyWith({
    bool? isSaving,
    bool? success,
    String? error,
  }) {
    return SaveExamState(
      isSaving: isSaving ?? this.isSaving,
      success: success ?? this.success,
      error: error ?? this.error,
    );
  }
}
