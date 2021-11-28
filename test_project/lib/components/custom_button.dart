import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final Widget? child;

  CustomButton({
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () => onTap!(),
        child: this.child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
