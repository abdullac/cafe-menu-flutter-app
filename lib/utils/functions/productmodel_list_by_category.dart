import 'package:cafemenu_app/core/model/product/product_model.dart';

/// this method for making Map for create lists by CategoryNames from productModelList
/// Map keys are categoryName, Map values are List of ProductModel by that key name
/// productmodelsByCategoryMap is Map of Lists by categoryNames
Map<String, List<ProductModel>> productmodelListByCategory(
    List<ProductModel> productModelList) {
  Map<String, List<ProductModel>> productmodelsByCategoryMap = {};

  /// iter produtModelist for gets Product models
  for (var productModel in productModelList) {
    /// gets CategoryName from each produtModel while iteration
    /// some times categoryName may null
    if (productModel.categoryName != null) {
      /// checking each productModel by categoryName for contains Map key match with categoryName in productmodelsByCategoryMap
      if (productmodelsByCategoryMap.containsKey(productModel.categoryName)) {
        /// if Map key with category name already contains in productmodelsByCategoryMap,
        /// then this productModel add to List of ProductModel by that categoryName key in productmodelsByCategoryMap
        productmodelsByCategoryMap[productModel.categoryName]!
            .add(productModel);
      } else {
        /// some times categoryName may null
        if (productModel.categoryName != null) {
          /// if not contains Map key with CategoryName
          /// then create new Map key with this categoryname in productmodelsByCategoryMap
          ///  and make value this productModel to that Map key
          productmodelsByCategoryMap[productModel.categoryName!] = [
            productModel
          ];
        }
      }
    }
  }
  return productmodelsByCategoryMap;
}
