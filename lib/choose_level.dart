import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseLevel extends StatelessWidget {
  const ChooseLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('a'),
            const Text('i'),
            ElevatedButton(
                onPressed: () => context.go('/play'), child: const Text('go'))
          ],
        ),
      ),
    );
  }
}
