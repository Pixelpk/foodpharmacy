import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/pref_manager.dart';
import '../pages/recommendation/categories/categories_page.dart';
import '../pages/sales/sales_page.dart';
import '../pages/home/home_page.dart';
import '../pages/product_item_page.dart';
import '../pages/coaching/coaching_page.dart';
import 'package:line_icons/line_icons.dart';

class CustomNavDrawer extends StatefulWidget {
  @override
  _CustomNavDrawerState createState() => _CustomNavDrawerState();
}

class _CustomNavDrawerState extends State<CustomNavDrawer> {
  String name, email;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    name = await PrefManager.getName();
    email = await PrefManager.getEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name??""),
            accountEmail: Text(email??""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                'T',
                style: TextStyle(fontSize: 40),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            child: drawerItem('Home'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductItemPage.routeName);
            },
            child: drawerItem('Products'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CoachingPage.routeName);
            },
            child: drawerItem('Coaching'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CategoriesPage.routeName);
            },
            child: drawerItem('TFP Recommendation'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SalesPage.routeName);
            },
            child: drawerItem('Sale'),
          ),
          drawerItem('Orders'),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 80),
            child: Divider(
              color: Colors.green,
              thickness: 2,
            ),
          ),
          drawerItem('FAQ'),
          drawerItem('Blog'),
          drawerItem('Contact Us'),
        ],
      ),
    );
  }

  Widget drawerItem(String title) {
    return Container(
      color: Colors.transparent,
      child: ListTile(
        title: Row(
          children: [
            Icon(
              LineIcons.dot_circle_o,
              color: Colors.green,
            ),
            Text(
              '  $title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
