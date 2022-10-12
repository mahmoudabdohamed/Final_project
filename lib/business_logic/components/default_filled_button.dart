import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class DefaultFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const DefaultFilledButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color:myYellow,
        borderRadius: BorderRadius.circular(35),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: myWhite, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}