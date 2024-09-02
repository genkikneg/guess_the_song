import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_song/main.dart';

class Heart extends ConsumerWidget {
  const Heart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heartNum = ref.watch(heartNumProvider);
    switch (heartNum) {
      case 0:
        return const SizedBox(
          height: 64,
          width: 128,
          child: Row(
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
        );
      case 1:
        return const SizedBox(
          height: 64,
          width: 128,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
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
        );
      case 2:
        return const SizedBox(
          height: 64,
          width: 128,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
              Icon(
                Icons.favorite_border,
                size: 32,
              ),
            ],
          ),
        );
      case 3:
        return const SizedBox(
          height: 64,
          width: 128,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
              Icon(
                Icons.favorite,
                size: 32,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
            ],
          ),
        );
      default:
        return const SizedBox(
          height: 64,
          width: 128,
          child: Text('エラー'),
        );
    }
  }
}
