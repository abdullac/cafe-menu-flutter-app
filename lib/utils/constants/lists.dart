import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';

/// availableItemsList is list of availableItems,
/// get availableItemsListsnapshot from firebase and assign to availableItemsList as list.
/// which is item of list includes itemName, itemId, categoryName, Qty....etc,
List<AvailableItemModel> availableItemsList = [];

/// diningCartList is list of ProductModel
/// diningCartList means list of selected ProductModels from mainly menucard page
List<AvailableItemModel> diningCartList = [];

/// get orderedlistsnapshot from firebase and assign to orderedListFromFireBase as list.
List<OrderModel> orderedListFromFireBase = [];
