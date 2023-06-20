import 'package:flutter/material.dart';
import 'package:pomodoro/models/auth.dart';

import 'package:pomodoro/pages/auth_or_home_page.dart';
import 'package:pomodoro/pages/home_page.dart';

import 'package:pomodoro/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.authOrHome: (ctx) => const AuthOrHomePage(),
          AppRoutes.HOME: (ctx) => const HomePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
