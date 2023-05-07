part of 'diningcart_page_bloc.dart';

@freezed
class DiningcartPageState with _$DiningcartPageState {
  const factory DiningcartPageState({
    required bool isSelected,
    required int? itemIndex,
    required Map<String, dynamic> valuesOfTotalSectionAsMap,
    required PositionType? positionTypeValue,
    required String? positionNumberValue,
    // required int? orderId,
    // required String? orderedTime,
    required DiningCartButtonFunctionality? diningCartButtonType,
    required DiningCartButtonFunctionality? diningCartButtonNotifier,
    required String diningCartButtonText,
  }) = _DiningcartPageState;
  factory DiningcartPageState.initial() {
    return const DiningcartPageState(
      isSelected: false,
      itemIndex: null,
      valuesOfTotalSectionAsMap: {},
      positionTypeValue: null,
      positionNumberValue: null,
      // orderId: null,
      // orderedTime: null,
      diningCartButtonType: null,
      diningCartButtonNotifier: null,
      diningCartButtonText: "take",
    );
  }
}
