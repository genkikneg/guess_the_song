import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: const Center(
                          child: Text(
                            '2',
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
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1,
                    color: Colors.red[50],
                    child: const Text(
                      '青に似た酸っぱい春とライラック',
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
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
                        onPressed: () {},
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
