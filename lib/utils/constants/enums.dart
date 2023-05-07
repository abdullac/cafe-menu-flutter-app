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
enum PositionType {
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

/// admin side. register or sign in and mainAdmin or sub admin
enum AuthentiationType {
  registerMainAdmin,
  registerSubAdmin,
  signInAdmin,
}

/// orderModel
enum OrderType {
  order,
  additionalOrder,
  runningOrder,
}
