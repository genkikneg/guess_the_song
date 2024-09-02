import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_song/main.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_song/reset_state.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

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
            '~~正解!~~',
            style: TextStyle(fontSize: 64),
            textAlign: TextAlign.center,
          ),
          const JudgeResult(),
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

class JudgeResult extends ConsumerWidget {
  const JudgeResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedNum = ref.watch(displeyedNumProvider);
    switch (displayedNum) {
      case 1:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                '神レベル',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 2:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'ミセス王',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 3:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                "真のJAM'S",
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 4:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'リリックマスター',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 5:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'リリックの探究者',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 6:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                '歌詞探知機',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 7:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                '言葉の旅人',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 8:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'ミセス上級者',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 9:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'ミセス中級者',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case 10:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Column(
            children: [
              Text(
                'あなたは',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Text(
                'ミセス初心者',
                style: TextStyle(fontSize: 64, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                'です。',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      default:
        return Container(
          margin: const EdgeInsets.all(32),
          child: const Text(
            'エラー：予期せぬ値です。',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
