import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_song/heart.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guess_the_song/ans_button.dart';
import 'package:guess_the_song/router.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_song/choose_level.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

//プロバイダー
final choosedSongNameProvider = StateProvider<String>((ref) => '');
final lyricsProvider = FutureProvider<List<String>>((ref) async {
  final db = FirebaseFirestore.instance;
  try {
    final choosedLevelNum = ref.watch(choosedLevelNumProvider);
    final docRef = db
        .collection('MrsGreenApple')
        .where('level', isEqualTo: choosedLevelNum);
    final QuerySnapshot querySnapshot = await docRef.get();
    final List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    docs.shuffle();
    DocumentSnapshot doc = docs.first;
    debugPrint(doc.id);
    final notifier = ref.read(choosedSongNameProvider.notifier);
    notifier.state = doc.id.toString();

    final data = doc.data() as Map<String, dynamic>;
    String lyrics = data['歌詞'];
    List<String> lyric = lyrics.split(' ');

    lyric.shuffle();

    return lyric.take(10).toList(); // 最初の10個の要素を返す
  } catch (e) {
    debugPrint('error: $e');
    rethrow;
  }
});
final displeyedNumProvider = StateProvider<int>((ref) => 1);
final heartNumProvider = StateProvider<int>((ref) => 3);
final isUntouchableProvider = StateProvider<bool>((ref) => false);
//歌詞のキャッシュ
List<String> lyrics = [];

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(),
      routerConfig: router,
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedNum = ref.watch(displeyedNumProvider);
    final asyncLyrics = ref.watch(lyricsProvider);
    final heartNum = ref.watch(heartNumProvider);
    final isUntouchable = ref.watch(isUntouchableProvider);
    if (heartNum == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final notifier = ref.read(isUntouchableProvider.notifier);
        notifier.state = true;
        Future.delayed(const Duration(seconds: 1), () {
          if (context.mounted) {
            context.go('/wrong_result');
          }
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: const Text('Mrs. GREEN APPLE'),
      ),
      body: Center(
        child: Container(
          color: Colors.green[100],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      height: 64,
                      width: 64,
                      child: Center(
                        child: Text(
                          '$displayedNum',
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    const Heart(),
                    const AnsButton(),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  height: MediaQuery.of(context).size.height / 1.65,
                  width: MediaQuery.of(context).size.width / 1,
                  color: Colors.red[50],
                  child: asyncLyrics.when(
                    data: (lyrics) {
                      final displayedItems = lyrics.take(displayedNum).toList();
                      return Column(
                        children: displayedItems
                            .map((item) => Text(
                                  item,
                                  style: const TextStyle(fontSize: 22.5),
                                  textAlign: TextAlign.center,
                                ))
                            .toList(),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text(
                      'エラー: $error',
                      style: const TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      iconSize: 64,
                    ),
                    IconButton(
                      onPressed: isUntouchable
                          ? null
                          : () {
                              final notifier =
                                  ref.read(displeyedNumProvider.notifier);
                              if (displayedNum < 10 && displayedNum > 0) {
                                notifier.state += 1;
                              } else if (displayedNum <= 0) {
                                notifier.state = 1;
                              } else {
                                notifier.state = 10;
                              }
                            },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        side: const BorderSide(color: Colors.grey, width: 2),
                      ),
                      icon: const Icon(Icons.record_voice_over_rounded),
                      iconSize: 64,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      iconSize: 64,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
