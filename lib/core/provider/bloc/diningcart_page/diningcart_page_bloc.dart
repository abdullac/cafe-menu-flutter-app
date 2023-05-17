
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/set_diningcartbutton_title.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/set_diningcartbutton_functionality.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/select_unselect_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diningcart_page_event.dart';
part 'diningcart_page_state.dart';
part 'diningcart_page_bloc.freezed.dart';

class DiningcartPageBloc
    extends Bloc<DiningcartPageEvent, DiningcartPageState> {
  DiningcartPageBloc() : super(DiningcartPageState.initial()) {
    on<UserClickedCheckbox>((event, emit) {
      selectOrUnselectItem(
        diningCartItem: event.diningCartItem,
        isSelect:
            event.diningCartItem.isSelectDiningCart == false ? true : false,
      );
      emit(state.copyWith(
        isSelected:
            event.diningCartItem.isSelectDiningCart == false ? true : false,
        itemIndex: event.itemIndex,
      ));
    });

    on<EditTotalSection>((event, emit) {
      Map<String, dynamic> valuesOfTotalSectionAsMap =
          findTotalItemsQtyAmount();
      emit(state.copyWith(
        valuesOfTotalSectionAsMap: valuesOfTotalSectionAsMap,
      ));
    });

    on<ChangePositionType>((event, emit) {
      emit(state.copyWith(
        positionTypeValue: event.changedPositionTypeValue,
      ));
    });

    on<ChangePositionNumber>((event, emit) {
      emit(state.copyWith(
        positionNumberValue: event.changedPositionNumberValue,
      ));
    });

    on<DiningCartButtonPressed>((event, emit) async {
      DiningCartButtonFunctionality? diningCartButtonType =
          await setDiningCartButtonFunctionality(
        diningCartButtonType: event.diningCartButtonType,
        isReTakeDiningCart: event.isReTakeDiningCart,
        positionCode: event.positionCode,
        diningCartItemForDelete: event.diningCartItemForDelete,
      );
      emit(state.copyWith(
        diningCartList: diningCartList,
        diningCartButtonType: diningCartButtonType,
        diningCartButtonText: setDiningCartButtonTitle(diningCartButtonType),
      ));
    });
  }
}
