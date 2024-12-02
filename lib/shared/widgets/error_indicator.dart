import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;

  const ErrorIndicator(
    this.errorMessage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
