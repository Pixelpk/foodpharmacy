import 'package:flutter/material.dart';
import 'package:foodpharmacy/pages/coaching/ScheduleMeeting.dart';
import 'package:foodpharmacy/wrapper.dart';
import 'pages/diet_plan/diet_plan_page.dart';
import 'pages/health_history/health_history_page.dart';
import 'pages/coaching/components/coaching_plan_page.dart';
import 'pages/sales/sales_page.dart';
import 'pages/recommendation/health_studio/health_studio_screen.dart';
import 'pages/recommendation/categories/categories_page.dart';
import 'pages/add_address/add_address_page.dart';
import 'pages/order_tracking/order_tracking_page.dart';
import 'pages/payments/payments_page.dart';
import 'pages/view_wish_list/view_wish_list_page.dart';
import 'pages/order_history/order_history_page.dart';
import 'pages/coaching/coaching_page.dart';
import 'pages/products/products_page.dart';
import 'pages/deposit_slip/deposit_slip_page.dart';
import 'pages/cart_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/home/home_page.dart';
import 'pages/product_detail/product_detail_page.dart';
import 'pages/profile_page.dart';
import 'pages/show_address_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/product_item_page.dart';
import 'pages/login/login_page.dart';
import 'pages/view_payment/view_payment_page.dart';

final Map<String, WidgetBuilder> routes = {
  // Wrapper.routeName: (context) => Wrapper(),
  ScheduleMeetingScreen.routeName: (context) => ScheduleMeetingScreen(),
  CartPage.routeName: (context) => CartPage(),
  EditProfilePage.routeName: (context) => EditProfilePage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  HomePage.routeName: (context) => HomePage(),
  LoginPage.routeName: (context) => LoginPage(),
  ProductDetailPage.routeName: (context) => ProductDetailPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ShowAddressPage.routeName: (context) => ShowAddressPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ProductItemPage.routeName: (context) => ProductItemPage(),
  AddAddressPage.routeName: (context) => AddAddressPage(),
  ViewWishListPage.routeName: (context) => ViewWishListPage(),
  PaymentsPage.routeName: (context) => PaymentsPage(),
  OrderTrackingPage.routeName: (context) => OrderTrackingPage(),
  OrderHistoryPage.routeName: (context) => OrderHistoryPage(),
  ProductsPage.routeName: (context) => ProductsPage(),
  CoachingPage.routeName: (context) => CoachingPage(),
  CoachingPlanPage.routeName: (context) => CoachingPlanPage(),
  DepositSlipPage.routeName: (context) => DepositSlipPage(),
  ViewPaymentPage.routeName: (context) => ViewPaymentPage(),
  CategoriesPage.routeName: (context) => CategoriesPage(),
  HealthStudioScreen.routeName: (context) => HealthStudioScreen(),
  SalesPage.routeName: (context) => SalesPage(),
  HealthHistoryPage.routeName: (context) => HealthHistoryPage(),
  DietPlanPage.routeName: (context) => DietPlanPage(),
};
