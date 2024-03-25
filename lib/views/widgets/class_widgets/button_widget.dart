import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.width,
    required this.text,
    required this.onPressed,
    required this.height,
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .5,
      height: height * .4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.withBlue(300),
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        child: Text(text,style: semiBoldBlack,),
      ),
    );
  }
}
