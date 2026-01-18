import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
