import 'package:cafemenu_app/core/model/product/product_model.dart';

/// this method for making Map for create lists by CategoryNames from availableItemList
/// Map keys are categoryName, Map values are List of availableItem by that key name
/// availableItemsByCategoryMap is Map of Lists by categoryNames
Map<String, List<ProductModel>> makeAvailableItemsListByCategoryMap(
    List<ProductModel> availableItemList) {
  /// declare empty Map availableItemsByCategoryMap.
  Map<String, List<ProductModel>> availableItemsByCategoryMap = {};

  /// iter availableItemList for gets Product s
  for (var availableItem in availableItemList) {
    /// gets CategoryName from each availableItem while iteration
    /// some times categoryName may null
    if (availableItem.categoryName != null) {
      /// checking each availableItem by categoryName 
      /// for contains Map key match with categoryName in availableItemByCategoryMap
      if (availableItemsByCategoryMap.containsKey(availableItem.categoryName)) {
        /// if Map key with category name already contains in availableItemsByCategoryMap,
        /// then this availableItem add to 
        /// List of availableItem by that categoryName key in availableItemsByCategoryMap
        availableItemsByCategoryMap[availableItem.categoryName]!
            .add(availableItem);
      } else {
        /// some times categoryName may null
        if (availableItem.categoryName != null) {
          /// if not contains Map key with CategoryName
          /// then create new Map key with this categoryname in availableItemsByCategoryMap
          ///  and make value this availableItem to that Map key
          availableItemsByCategoryMap[availableItem.categoryName!] = [
            availableItem
          ];
        }
      }
    }
  }
  return availableItemsByCategoryMap;
}
