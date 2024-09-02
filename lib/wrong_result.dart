import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_song/reset_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WrongResult extends ConsumerWidget {
  const WrongResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 100),
              ),
              onPressed: () {
                resetState(ref);
                context.go('/');
              },
              child: const Text(
                'もう一度遊ぶ',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )),
        ],
      )),
    );
  }
}
