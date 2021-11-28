import 'package:flutter/material.dart';
import 'package:test_project/components/custom_button.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({Key? key, this.onTap}) : super(key: key);
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        child: Text('Try again'),
        onTap: () => onTap!(),
      ),
    );
  }
}
