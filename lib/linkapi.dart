class AppLink {
  static const String serverLink = "http://192.168.217.234/php/ecommerce";
  static const String testLink = "$serverLink/test.php";

  //============================ Auth =========================//

  static const String signUpLink = "$serverLink/auth/signup.php";
  static const String verfiyCodeSignUpLink = "$serverLink/auth/verfiycode.php";
  static const String loginLink = "$serverLink/auth/login.php";

  //============================ Auth =========================//
  static const String checkEmail = "$serverLink/auth/checkemail.php";
  static const String resetPassword = "$serverLink/auth/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$serverLink/auth/verfiycode.php";

  //============================ Home =========================//
  static const String homeLink = "$serverLink/home.php";

  //============================ Items =========================//
  static const String itemsLink = "$serverLink/items/items.php";

  //============================ Image =========================//
  static const String imageLink = "$serverLink/upload";
  static const String categoriesImageLink = "$serverLink/upload/categories";
  static const String itemsImageLink = "$serverLink/upload/items";
  static const String supriseImageLink = "$serverLink/upload/suprise";

  //============================ Favorite =========================//
  static const String favoriteAdd = "$serverLink/favorite/add.php";
  static const String favoriteRemove = "$serverLink/favorite/remove.php";
  static const String favoriteView = "$serverLink/favorite/view.php";
  static const String deleteFromFavorite =
      "$serverLink/favorite/deletefromfavorite.php";

  //============================ Cart =========================//
  static const String cartAdd = "$serverLink/cart/add.php";
  static const String cartDelete = "$serverLink/cart/delete.php";
  static const String cartView = "$serverLink/cart/view.php";
  static const String cartGetCountItems = "$serverLink/cart/getcountitems.php";
  //============================ Search =========================//
  static const String searchLink = "$serverLink/items/search.php";
  //============================ Address =========================//
  static const String addressAddLink = "$serverLink/address/add.php";
  static const String addressViewLink = "$serverLink/address/view.php";
  static const String addressdeleteLink = "$serverLink/address/delete.php";
  static const String addressEditLink = "$serverLink/address/edit.php";
  //============================ Coupon =========================//
  static const String checkCoupon = "$serverLink/coupon/checkcoupon.php";
  //============================ Orders =========================//
  static const String checkout = "$serverLink/orders/checkout.php";
  static const String pendingOrder = "$serverLink/orders/pending.php";
  static const String archiveOrder = "$serverLink/orders/archive.php";
  static const String detailsOrder = "$serverLink/orders/details.php";
  static const String orderDeleye = "$serverLink/orders/delete.php";

  //============================ Notification =========================//
  static const String notificationLink = "$serverLink/notification.php";

  //============================ Offers =========================//
  static const String offersLink = "$serverLink/offers.php";
  //============================ Rating =========================//
  static const String ratingLink = "$serverLink/rating.php";

  //============================ Suprise =========================//
  static const String supriseLink = "$serverLink/suprise.php";
}
