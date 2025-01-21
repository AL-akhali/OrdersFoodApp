import 'package:full_ecommerce/core/constant/routes.dart';
import 'package:full_ecommerce/core/middleware/mymiddleware.dart';
import 'package:full_ecommerce/view/screen/address/add.dart';
import 'package:full_ecommerce/view/screen/address/view.dart';
import 'package:full_ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:full_ecommerce/view/screen/auth/login.dart';
import 'package:full_ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:full_ecommerce/view/screen/auth/signup.dart';
import 'package:full_ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:full_ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:full_ecommerce/view/screen/auth/success_signup.dart';
import 'package:full_ecommerce/view/screen/auth/verfiycodesigncode.dart';
import 'package:full_ecommerce/view/screen/cart.dart';
import 'package:full_ecommerce/view/screen/checkout.dart';
import 'package:full_ecommerce/view/screen/home.dart';
import 'package:full_ecommerce/view/screen/homescreen.dart';
import 'package:full_ecommerce/view/screen/items.dart';
import 'package:full_ecommerce/view/screen/language.dart';
import 'package:full_ecommerce/view/screen/myfavorite.dart';
import 'package:full_ecommerce/view/screen/notification.dart';
import 'package:full_ecommerce/view/screen/offers.dart';
import 'package:full_ecommerce/view/screen/onboarding.dart';
import 'package:full_ecommerce/view/screen/orders/archive.dart';
import 'package:full_ecommerce/view/screen/orders/details.dart';
import 'package:full_ecommerce/view/screen/orders/pending.dart';
import 'package:full_ecommerce/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => CartScreen(),
  // ),
  GetPage(name: "/", page: () => Language(), middlewares: [Mymiddleware()]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const LoginPage()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpPage()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetpassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignup()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  //hOME
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.itemsScreen, page: () => const ItemsScreen()),
  GetPage(name: AppRoute.productsDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyfavoriteScreen()),
  GetPage(name: AppRoute.cartScreen, page: () => const CartScreen()),
  GetPage(name: AppRoute.checkoutScreen, page: () => const CheckoutScreen()),
  GetPage(name: AppRoute.offerScreen, page: () => const OffersScreen()),
  GetPage(name: AppRoute.languageScreen, page: () => const Language()),

  //address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),

  //order
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchive()),

  //notifucation
  GetPage(
      name: AppRoute.notificationScreen,
      page: () => const NotificationScreen()),
];
