import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_song/choose_level.dart';
import 'package:guess_the_song/main.dart';
import 'package:guess_the_song/result.dart';
import 'package:guess_the_song/wrong_result.dart';

final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const ChooseLevel();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'play',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: 'result',
        builder: (BuildContext context, GoRouterState state) {
          return const Result();
        },
      ),
      GoRoute(
        path: 'wrong_result',
        builder: (BuildContext context, GoRouterState state) {
          return const WrongResult();
        },
      ),
    ],
  ),
]);

GoRouter get router => _router;
