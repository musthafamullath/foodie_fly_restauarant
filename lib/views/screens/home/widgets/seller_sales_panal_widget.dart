
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';

class SellerSalesPanalWidget extends StatelessWidget {
  const SellerSalesPanalWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 20,
      child: Container(
        width: width * 9 / 10,
        height: width * 4 / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.orange.withBlue(300),
          border: Border.all(
            width: 1.5,
            color: Colors.orange.shade800,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeInRightBig(
              child: Container(
                width: width * 4 / 10,
                height: 140 / 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Colors.orange.shade800,
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.all(7),
                  elevation: 5,
                  shadowColor: Colors.orange.withBlue(900),
                  surfaceTintColor: Colors.orange.withBlue(900),
                  child: Column(
                    children: [
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/icons/ordericon.png'),
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text.rich(TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Today: ', style: semiBoldBlack),
                            TextSpan(text: '0', style: boldOrange),
                          ])),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/icons/ordericon.png'),
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Total: ',
                                    style: semiBoldBlack),
                                TextSpan(text: '0', style: boldOrange),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeftBig(
              child: Container(
                width: width * 4 / 10,
                height: 140 / 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.orange.shade800,
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.all(7),
                  elevation: 5,
                  shadowColor: Colors.orange.withBlue(900),
                  surfaceTintColor: Colors.orange.withBlue(900),
                  child: Column(
                    children: [
                      Text(
                        "Revenue",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/icons/revenueicon.png'),
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text.rich(TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Today: ', style: semiBoldBlack),
                            TextSpan(text: '0', style: boldOrange),
                          ])),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/icons/revenueicon.png'),
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text.rich(TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Total: ', style: semiBoldBlack),
                            TextSpan(text: '0', style: boldOrange),
                          ])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}