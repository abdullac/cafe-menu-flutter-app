part of 'menucard_page_bloc.dart';

@freezed
class MenucardPageEvent with _$MenucardPageEvent {
  const factory MenucardPageEvent.userScrolledPageview({
    required UserScrollNotification notification,
    required int categoryIndex,
  }) = UserScrolledPageview;
  const factory MenucardPageEvent.findLocationByStream({
    required bool isLocationLoading,
  }) = FindLocationByStream;
}
