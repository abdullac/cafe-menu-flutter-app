import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

/// method for takeNow order diningCart list
/// filter dingCart list when press takeNow button,
/// avoid items with 0 orederedQty.
buttonPressedForTakeNow() {
  List<ProductModel> diningCartListTemp = [];
  /// loop diningCart list,
  /// get and add to diningCartListTemp if not 0 orderedQty items
  for (var diningCartItem in diningCartList) {
    if (![null, 0].contains(diningCartItem.orderedQty) &&
        diningCartItem.isSelectDiningCart != false) {
      diningCartListTemp.add(diningCartItem);
    }
  }
  /// diningCartListTemp assiign to diningCartList;
  diningCartList = diningCartListTemp;
  /// notify diningCartListViewNotifier for rebuild diningCart widgets.
  PageDiningCart.diningCartListViewNotifier.notifyListeners();
}
