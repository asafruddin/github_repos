import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_outlined,
                size: 50, color: Colors.red),
            const SizedBox(height: 20),
            Text('Something went wrong',
                style: Theme.of(context).textTheme.headlineMedium),
            Text(message ?? 'Something went wrong while fetching data',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Refresh'))
          ],
        ),
      ),
    );
  }
}
