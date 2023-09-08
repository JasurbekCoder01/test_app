import 'package:flutter/material.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:test_app/src/utils/utils.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: AppTheme.fontSFPro,
            fontWeight: FontWeight.w400,
            fontSize: 18 * context.h,
            color: AppTheme.black,
          ),
        ),
      ),
    );
  }
}
