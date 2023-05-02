import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';

/// availableItemsList is list of availableItems,
/// get availableItemsListsnapshot from firebase and assign to availableItemsList as list.
/// which is item of list includes itemName, itemId, categoryName, Qty....etc,
List<ProductModel> availableItemsList = [];

/// diningCartList is list of ProductModel
/// diningCartList means list of selected ProductModels from mainly menucard page
List<ProductModel> diningCartList = [];

/// get orderedlistsnapshot from firebase and assign to orderedListFromFireBase as list.
List<CustomerModel> orderedListFromFireBase = [];
