import 'package:flutter/material.dart';
import 'package:test_app/src/theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppTheme.white,
          ),
          child: Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppTheme.black,
            ),
          ),
        ),
      ),
    );
  }
}
