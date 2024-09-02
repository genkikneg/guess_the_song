import 'package:flutter/material.dart';
import 'package:guess_the_song/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_song/main.dart';

//解答ボタン
class AnsButton extends ConsumerWidget {
  const AnsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUntouchable = ref.watch(isUntouchableProvider);
    return SizedBox(
      height: 64,
      width: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shape: const CircleBorder()),
        onPressed: isUntouchable
            ? null
            : () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog.fullscreen(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SearchPage(),
                                const SizedBox(
                                  // height: MediaQuery.of(context).size.height / 1.5,
                                  height: 15,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 100),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      '閉じる',
                                      style: TextStyle(fontSize: 32),
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                          ),
                        ));
              },
        child: const Text(
          '解\n答',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
