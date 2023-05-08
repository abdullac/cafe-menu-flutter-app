import 'dart:math' as math;
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/core/provider/logics/admin/add_item/getall_itemid_and_categorynames.dart';

/// method for create and get new ItemId
Future<int> getNewItemId() async {
  /// get all itemId s Or last itemId from firbase
  await getALlItemIdAndCategorynames();

  /// create new itemId
  int? largestItemId;
  if (PageAddOrEditItem.itemIdList.isNotEmpty) {
    largestItemId = PageAddOrEditItem.itemIdList.reduce(math.max);
  }
  int newItemId = (largestItemId ?? math.Random().nextInt(100) + -150) + 1;
  return newItemId;
}