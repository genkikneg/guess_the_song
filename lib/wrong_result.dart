import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WrongResult extends StatelessWidget {
  const WrongResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[100],
        title: const Text('Mrs. GREEN APPLE'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            '~~残念!~~',
            style: TextStyle(fontSize: 64),
            textAlign: TextAlign.center,
          ),
          const Text(
            'また遊んでね',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: () => context.go('/play'),
              child: const Text('もう一度遊ぶ')),
        ],
      )),
    );
  }
}
