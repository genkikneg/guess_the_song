import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_song/main.dart';
import 'package:guess_the_song/choose_level.dart';
import 'package:guess_the_song/search_page.dart';

void resetState(WidgetRef ref) {
  ref.invalidate(choosedSongNameProvider);
  ref.invalidate(lyricsProvider);
  ref.invalidate(displeyedNumProvider);
  ref.invalidate(heartNumProvider);
  ref.invalidate(isUntouchableProvider);
  ref.invalidate(choosedLevelNumProvider);
  ref.invalidate(songProvider);
  ref.invalidate(searchIndexListProvider);
}
