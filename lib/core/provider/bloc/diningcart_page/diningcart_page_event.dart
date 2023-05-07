part of 'diningcart_page_bloc.dart';

@freezed
class DiningcartPageEvent with _$DiningcartPageEvent {
  const factory DiningcartPageEvent.userClickedCheckbox({
    required AvailableItemModel diningCartItem,
    required int itemIndex,
  }) = UserClickedCheckbox;
  const factory DiningcartPageEvent.editTotalSection() = EditTotalSection;
  const factory DiningcartPageEvent.changePositionType({
    required PositionType? changedPositionTypeValue,
  }) = ChangePositionType;
  const factory DiningcartPageEvent.changePositionNumber({
    required String? changedPositionNumberValue,
  }) = ChangePositionNumber;
  // const factory DiningcartPageEvent.setOrderIdAndTime({
  //   required DiningCartButtonFunctionality? diningCartButtonType,
  // }) = SetOrderIdAndTime;
  const factory DiningcartPageEvent.diningCartButtonPressed({
    required DiningCartButtonFunctionality? diningCartButtonType,
  }) = DiningCartButtonPressed;
  const factory DiningcartPageEvent.diningCartListview() = DiningCartListview;
}
