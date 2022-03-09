import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String? loadingMessage;

  const LoadingScreen({Key? key, required this.loadingMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}
