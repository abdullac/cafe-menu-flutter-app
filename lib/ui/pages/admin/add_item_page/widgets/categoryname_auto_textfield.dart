import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:flutter/material.dart';

/// this widget is auto complete textfield for get category name
class CategoryNameAutoTextField extends StatelessWidget {
  final AvailableItemModel? editItem;
  const CategoryNameAutoTextField({super.key, this.editItem});

  @override
  Widget build(BuildContext context) {
    /// auto complete widget0
    return Autocomplete(
      fieldViewBuilder:
          (context, autoCompletetextEditingController, focusNode, onFieldSubmitted) {
        if (editItem != null && editItem!.categoryName != null) {
          autoCompletetextEditingController.text = editItem!.categoryName!;
        }
        /// get text from autoComplete editingcontroller and assign to textfield editingController 
        if (autoCompletetextEditingController.text.isNotEmpty) {
          PageAddOrEditItem.categoryNameEditingController =
              autoCompletetextEditingController;
        }

        /// cateegoryName textFeild
        return TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Category Name",
          ),
          controller: PageAddOrEditItem.categoryNameEditingController,
          focusNode: focusNode,
          onSubmitted: (value) {
            ///
          },
        );
      },
      /// text list (String list)
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == "") {
          return const Iterable<String>.empty();
        } else {
          List<String> matches = <String>[];
          /// get matched texts(strings) from categoryNameList 
          /// and reassign/re add to matches list.
          matches.addAll(PageAddOrEditItem.categoryNameList);
          matches.retainWhere((element) {
            return element
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
          /// return matched string list.
          return matches;
        }
      },
      onSelected: (String selection) {
        PageAddOrEditItem.categoryNameEditingController.text = selection;
      },
    );
  }
}
