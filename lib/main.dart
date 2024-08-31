import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

final lyricsProvider = FutureProvider<List<String>>((ref) async {
  final db = FirebaseFirestore.instance;
  try {
    final docRef = db.collection('MrsGreenApple').doc('青と夏');
    DocumentSnapshot doc = await docRef.get();

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

//プロバイダー
final displeyedNumProvider = StateProvider<int>((ref) => 1);
//歌詞のキャッシュ
List<String> lyrics = [];

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedNum = ref.watch(displeyedNumProvider);
    final asyncLyrics = ref.watch(lyricsProvider);
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
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
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 128,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 32,
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 32,
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 64,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Text(
                            '解\n答',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width / 1,
                    color: Colors.red[50],
                    child: asyncLyrics.when(
                      data: (lyrics) {
                        final displayedItems =
                            lyrics.take(displayedNum).toList();
                        return Column(
                          children: displayedItems
                              .map((item) => Text(
                                    item,
                                    style: const TextStyle(fontSize: 30),
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
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        iconSize: 64,
                      ),
                      IconButton(
                        onPressed: () {
                          final notifier =
                              ref.read(displeyedNumProvider.notifier);
                          notifier.state += 1;
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          side: BorderSide(color: Colors.grey, width: 2),
                        ),
                        icon: Icon(Icons.record_voice_over_rounded),
                        iconSize: 64,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                        iconSize: 64,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
