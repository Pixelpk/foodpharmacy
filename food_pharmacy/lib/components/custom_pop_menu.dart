import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpharmacy/pages/edit_profile_page.dart';
import 'package:foodpharmacy/pages/order_tracking/order_tracking_page.dart';
import 'package:foodpharmacy/pages/payments/payments_page.dart';
import 'package:foodpharmacy/pages/profile_page.dart';
import 'package:foodpharmacy/pages/view_wish_list/view_wish_list_page.dart';
import 'package:foodpharmacy/pages/order_history/order_history_page.dart';
import 'package:foodpharmacy/responsive/size_config.dart';
import 'package:foodpharmacy/pages/login/login_page.dart';
import 'package:line_icons/line_icons.dart';

class CustomPopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.pushNamed(context, ViewWishListPage.routeName);
            break;
          case 2:
            Navigator.pushNamed(context, ProfilePage.routeName);
            break;
          case 3:
            Navigator.pushNamed(context, EditProfilePage.routeName);
            break;
          case 4:
            Navigator.pushNamed(context, PaymentsPage.routeName);
            break;
          case 5:
            Navigator.pushNamed(context, OrderHistoryPage.routeName);
            break;
          case 6:
            Navigator.pushNamed(context, OrderTrackingPage.routeName);
            break;
          case 7:
            Navigator.pushNamed(context, LoginPage.routeName);
            break;
          default:
            break;
        }
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        customMenuItem(LineIcons.heart_o, 'View Wish list', 1),
        customMenuItem(LineIcons.male, 'View Profile', 2),
        customMenuItem(LineIcons.male, 'Edit Profile', 3),
        customMenuItem(LineIcons.dollar, 'Payments', 4),
        customMenuItem(Icons.arrow_downward, 'Order History', 5),
        customMenuItem(Icons.arrow_downward, 'Order Tracking', 6),
        customMenuItem(Icons.logout, 'Logout', 7),
      ],
    );
  }

  PopupMenuItem customMenuItem(IconData icon, String title, int val) {
    return PopupMenuItem(
      value: val,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 2,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
