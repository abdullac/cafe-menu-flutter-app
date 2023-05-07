part of 'menucard_page_bloc.dart';

@freezed
class MenucardPageState with _$MenucardPageState {
  const factory MenucardPageState({
    required bool showLeftArrow,
    required bool showRightArrow,
    required int? categoryIndex,
  }) = _MenucardPageState;

  factory MenucardPageState.initial() {
    return const MenucardPageState(
      showLeftArrow: false,
      showRightArrow: false,
      categoryIndex: null,
    );
  }
}
