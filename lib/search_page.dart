import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_song/main.dart';

final List<String> songNames = [];
//プロバイダー
final songProvider = FutureProvider<List<String>>((ref) async {
  final db = FirebaseFirestore.instance;
  try {
    final docRef = db.collection('MrsGreenApple');
    final QuerySnapshot querySnapshot = await docRef.get();
    final List<DocumentSnapshot> docs = querySnapshot.docs;

    List<String> songNames = docs.map((doc) => doc.id.toString()).toList();
    return songNames;
  } catch (e) {
    debugPrint('error: $e');
    rethrow;
  }
});
final StateProvider<List<int>> searchIndexListProvider =
    StateProvider((ref) => []);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(songProvider).when(
          data: (songNames) {
            return Column(
              children: [
                _searchTextField(ref, songNames),
                _searchListView(ref, songNames)
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text('Error: $e')),
        );
  }
}

Widget _searchTextField(WidgetRef ref, List<String> songNames) {
  final searchIndexListNotifier = ref.watch(searchIndexListProvider.notifier);
  return TextField(
    autofocus: true,
    onChanged: (String text) {
      searchIndexListNotifier.state = [];
      for (int i = 0; i < songNames.length; i++) {
        if (songNames[i].contains(text)) {
          searchIndexListNotifier.state.add(i);
        }
      }
    },
  );
}

Widget _searchListView(WidgetRef ref, List<String> songNames) {
  final searchIndexListNotifier = ref.watch(searchIndexListProvider.notifier);
  final searchIndexList = ref.watch(searchIndexListProvider);
  bool isRight;
  return SizedBox(
    height: 400,
    child: ListView.builder(
      itemCount: searchIndexList.length,
      itemBuilder: (context, int index) {
        // index = searchIndexListNotifier.state[index];
        final songIndex = searchIndexListNotifier.state[index];
        return Card(
          child: ListTile(
            onTap: () {
              isRight = _judgAns(songNames[songIndex], ref);
              isRight ? context.go('/result') : _wrong(context, ref);
            },
            title: Text(songNames[songIndex]),
          ),
        );
      },
    ),
  );
}

void _wrong(context, WidgetRef ref) {
  final notifier = ref.read(heartNumProvider.notifier);
  HapticFeedback.mediumImpact();
  notifier.state -= 1;
  Navigator.pop(context);
}

bool _judgAns(String songName, WidgetRef ref) {
  final choosedSongName = ref.watch(choosedSongNameProvider);
  debugPrint('合ってる？$songName');
  debugPrint('正解:$choosedSongName');
  return songName == choosedSongName;
}
