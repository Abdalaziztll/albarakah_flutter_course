import 'package:controller_types/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage1();
      },
      routes: <RouteBase>[
        GoRoute(path: 'testpage',
        builder: (context, state) => TestPage(),
        routes: <RouteBase>[
          GoRoute(path: 'homepage',builder: (context, state) => AnoutherTestPage(),)
        ]
        ),
        
      ]
    ),
  ],
);

class AnoutherTestPage extends StatelessWidget {
  const AnoutherTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}