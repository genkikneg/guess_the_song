import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//プロバイダー
final choosedLevelNumProvider = StateProvider<int>((ref) => 2);

class ChooseLevel extends ConsumerWidget {
  const ChooseLevel({super.key});

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
          children: [
            const Text(
              'ミセス曲当てゲーム',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 100),
                      ),
                      onPressed: () {
                        final notifier =
                            ref.read(choosedLevelNumProvider.notifier);
                        notifier.state = 0;
                        context.go('/play');
                      },
                      child: const Text(
                        '上級',
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 100),
                      ),
                      onPressed: () {
                        final notifier =
                            ref.read(choosedLevelNumProvider.notifier);
                        notifier.state = 1;
                        context.go('/play');
                      },
                      child: const Text(
                        '中級',
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 100),
                      ),
                      onPressed: () {
                        final notifier =
                            ref.read(choosedLevelNumProvider.notifier);
                        notifier.state = 2;
                        context.go('/play');
                      },
                      child: const Text(
                        '初級',
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
