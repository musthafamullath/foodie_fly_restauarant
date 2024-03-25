import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';

class DemoUser extends StatelessWidget {
  const DemoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Demo User",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              decoration: TextDecoration.underline),
        ),
        textSpanWidget(
          blackText: 'Email-address: ',
          orangeText: 'cochincafe@gmail.com',
        ),
        textSpanWidget(
          blackText: 'Password: ',
          orangeText: 'CochinCafe@123',
        ),
      ],
    );
  }

  Text textSpanWidget({required String blackText, required String orangeText}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: blackText, style: semiBoldGrey),
          TextSpan(text: orangeText, style: semiBoldOrangeGray)
        ],
      ),
    );
  }
}