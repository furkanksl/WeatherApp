import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;

  final Function? onRetryPressed;

  const ErrorScreen({
    Key? key,
    required this.errorMessage,
    required this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage ?? 'Try it again',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0F8EDD),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text(
              'Retry',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => onRetryPressed!(),
          )
        ],
      ),
    );
  }
}
