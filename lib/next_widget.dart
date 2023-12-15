// next_widget.dart

import 'package:flutter/material.dart';

class NextWidget extends StatelessWidget {
  const NextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Widget'),
      ),
      body: const Center(
        child: Text('Welcome to the next widget!'),
      ),
    );
  }
}
