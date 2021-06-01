import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../media_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'TFP Recommendation',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(10)),
                      child: Container(
                        height: MediaConfig.screenHeight * 0.6,
                        color: Colors.green,
                        child: Column(
                          children: [
                            Image(
                              height: MediaConfig.screenHeight * 0.4,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/recommendation.png'),
                            ),
                            buildItem(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Text(
            'Healthy Food',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Health is a state of complete physical',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: getProportionateScreenWidth(15),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: getProportionateScreenWidth(15),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: getProportionateScreenWidth(15),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: getProportionateScreenWidth(15),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.greenAccent,
                    size: getProportionateScreenWidth(15),
                  ),
                ],
              ),
              Text(
                'TFP Rating',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              '4.0/5',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
