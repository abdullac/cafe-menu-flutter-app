int setOrderNumber() {
  /// create method for get last number from firebase realtime database.
  int? lastOrderNumberFromFirebase = 611 + 1;

  /// set new order number to irebase realtime database.
  return lastOrderNumberFromFirebase ?? 10023;
}
