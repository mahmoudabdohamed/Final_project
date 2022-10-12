import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class DefaultBorderButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const DefaultBorderButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
         // foregroundColor: kOrange,
          side: const BorderSide(width: 1.5, color:myYellow),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        ),
        child: Text(title,
          style: const TextStyle(color: myYellow, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}