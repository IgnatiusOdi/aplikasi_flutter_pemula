import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:aplikasi_flutter_pemula/screen/home_screen.dart';
import 'package:aplikasi_flutter_pemula/screen/quiz_screen.dart';
import 'package:aplikasi_flutter_pemula/screen/cat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
          name: "home",
          path: "/",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              name: "quiz",
              path: "quiz",
              builder: (context, state) => QuizScreen(),
            ),
            GoRoute(
              name: "cats",
              path: "cats",
              builder: (context, state) => const CatScreen(),
            )
          ])
    ],
    errorBuilder: (context, state) {
      // use a post frame callback to perform your navigation after
      // the build frame has finished
      WidgetsBinding.instance
          .addPostFrameCallback((timeStamp) => _router.goNamed('home'));

      // you must return a widget anyway
      return const SizedBox.shrink();
    });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "IS THIS A CAT?",
      routerConfig: _router,
    );
  }
}
