import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/pages/show_address_page.dart';
import '../responsive/size_config.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/cart_page";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              CustomPopMenu(),
            ],
          ),
          drawer: CustomNavDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Text(
                  'Cart :',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                customCart('assets/images/image_pro_3.png', 'Olive oil',
                    '\$115.00', '500ml', '02', '\$78.00'),
                Divider(
                  color: Colors.black,
                ),
                customCart('assets/images/image_pro_2.png', 'Jasmine', '\$100.00',
                    '500ml', '01', '\$98.00'),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 5.0),
                        child: Text(
                          'Continue Shop',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1,
                ),
                Text(
                  'Sub Totals',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      ),
                    ),
                    Text(
                      '\$78.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Totals',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      ),
                    ),
                    Text(
                      '\$78.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, ShowAddressPage.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            'Proceed to checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customCart(String url, String product, String price, String size,
      String quantity, String total) {
    return Row(
      children: [
        Container(
          height: SizeConfig.safeBlockVertical * 25,
          width: SizeConfig.safeBlockHorizontal * 32,
          child: Center(
            child: Container(
              height: SizeConfig.safeBlockVertical * 20,
              width: SizeConfig.safeBlockHorizontal * 30,
              child: Image(
                image: AssetImage(
                  url,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Container(
          height: SizeConfig.safeBlockVertical * 25,
          width: SizeConfig.safeBlockHorizontal * 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ),
              customItems('Products', product),
              customItems('Unit Price', price),
              customItems('Size', size),
              customItems('Quantity', quantity),
              customItems('Total', total),
            ],
          ),
        ),
      ],
    );
  }

  Widget customItems(String title, String value) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.safeBlockHorizontal * 5,
        ),
        Container(
          width: SizeConfig.safeBlockHorizontal * 20,
          child: Text(
            title,
          ),
        ),
        SizedBox(
          width: SizeConfig.safeBlockHorizontal * 5,
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
