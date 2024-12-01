import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;

  const ErrorIndicator(
    this.errorMessage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          errorMessage,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
