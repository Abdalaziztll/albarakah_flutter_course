import 'package:bloc_session/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'secondPage',
          builder: (context, state) => SecondPage(),
        ),
      ],
    )
  ],
);
