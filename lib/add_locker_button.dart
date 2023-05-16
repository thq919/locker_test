import 'package:flutter/material.dart';

import 'const_colors.dart';

class AddLockerButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddLockerButton({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: ConstColors.mainColor,
            shadowColor: Colors.white,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        onPressed: onPressed,
        child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Text("+ Add locker")),
      ),
    );
  }
}
