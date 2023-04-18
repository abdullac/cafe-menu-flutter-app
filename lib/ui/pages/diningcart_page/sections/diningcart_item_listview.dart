import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_item.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

// int orderLength = 5;
// int additionalOrderLength = 3;
// int runningOrderLength = 2;
// int length = orderLength + additionalOrderLength + runningOrderLength;


class DiningCartItemListview extends StatelessWidget {
  const DiningCartItemListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PageDiningCart.diningCartListViewNotifier,
      builder: (context,newValue,_) {
        return Center(
          child: ListView.separated(
            itemCount: diningCartList.length,
            itemBuilder: ((context, index) => DiningCartItem(
                  index: index,
                  productModellist: diningCartList,
                )),
            separatorBuilder: (context, index) {
              // if (index == orderLength - 1 && additionalOrderLength > 0) {
              //   return container(Colors.cyan, "Additional");
              // } else if (index == (orderLength + additionalOrderLength - 1) &&
              //     runningOrderLength > 0) {
              //   return container(Colors.deepOrange, "Running");
              // } else {
              return const SizedBox();
              // }
            },
          ),
        );
      }
    );
  }
}

Widget container(Color color, String title) => Container(
      height: 30,
      color: color,
      child: Center(child: Text(title)),
    );
