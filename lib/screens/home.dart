// home screen code
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astrophotography Blog'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    ); // Scaffold is a frame

  }
}