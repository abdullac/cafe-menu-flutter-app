part of 'menucard_page_bloc.dart';

@freezed
class MenucardPageEvent with _$MenucardPageEvent {
  const factory MenucardPageEvent.leftScrollIndicator({
    required bool reachToStart,
    required int categoryIndex,
  }) = LeftScrollIndicator;
  const factory MenucardPageEvent.rightScrollIndicator({
    required bool reachToEnd,
    required int categoryIndex,
  }) = RightScrollIndicator;
  const factory MenucardPageEvent.userScrolledPageview({
    required UserScrollNotification notification,
    required int categoryIndex,
  }) = UserScrolledPageview;
}
