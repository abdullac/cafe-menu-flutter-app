part of 'diningcart_page_bloc.dart';

@freezed
class DiningcartPageState with _$DiningcartPageState {
  const factory DiningcartPageState({
    required List<AvailableItemModel> diningCartList,
    required bool isSelected,
    required int? itemIndex,
    required Map<String, dynamic> valuesOfTotalSectionAsMap,
    required PositionType? positionTypeValue,
    required String? positionNumberValue,
    required DiningCartButtonFunctionality? diningCartButtonType,
    required String diningCartButtonText,
  }) = _DiningcartPageState;
  factory DiningcartPageState.initial() {
    return const DiningcartPageState(
      diningCartList: [],
      isSelected: false,
      itemIndex: null,
      valuesOfTotalSectionAsMap: {},
      positionTypeValue: null,
      positionNumberValue: null,
      diningCartButtonType: null,
      diningCartButtonText: "take",
    );
  }
}
