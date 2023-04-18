

/// comingPage means, the page is before go to anther page/screen, 
/// if go to another page using navigator or any.., current page is comingPage
enum ComingPage {
  menuCard,
  diningCart,
}


/// increase or decrease productModel Qty
enum ChangeQty {
  increase,
  decrease,
}

/// selecet customer sitting positiontype
enum TableOrChair {
  table,
  chair,
}

/// diningcart button is work with deffrent functionalities
enum DiningCartButtonFunctionality {
  takeNow,
  orderConfirm,
  additionalOrder,
  confirmAdditionalOrder,
  runningOrder,
  confirmRunningOrder,
  gotoGallery,
  // cancelOrder,
  // payAmount
}
