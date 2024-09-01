import 'package:flutter/material.dart';
import 'package:guess_the_song/search_page.dart';

//解答ボタン
class AnsButton extends StatelessWidget {
  const AnsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shape: const CircleBorder()),
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog.fullscreen(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SearchPage(),
                        SizedBox(
                          // height: MediaQuery.of(context).size.height / 1.5,
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('閉じる'))
                      ],
                    ),
                  ),
                )),
        child: const Text(
          '解\n答',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
