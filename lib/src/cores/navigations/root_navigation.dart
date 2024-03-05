import 'package:flutter/material.dart';
import 'package:food_ninja/src/presentations/dashboards/home_screen.dart';
import 'package:food_ninja/src/presentations/index.dart';
import 'package:go_router/go_router.dart';
import './paths/index.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellDahsboardNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'dashboard');

renderCustomTransition(Widget child) {
  return (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      barrierDismissible: true,
      barrierColor: Colors.black38,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 100),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  };
}

final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: "/", name: "intro", builder: (c, s) => IntroScreen()),
      GoRoute(
          path: routePaths.login.path,
          name: routePaths.login.name,
          builder: (c, s) => const LoginScreen()),
      GoRoute(
          path: "/forgotpassword",
          name: "forgotpassword",
          builder: (c, s) => const ForgotPasswordScreen()),
      GoRoute(
          path: "/resetpassword",
          name: "resetpassword",
          builder: (c, s) => const ResetPasswordScreen()),
      GoRoute(
          path: "/signup",
          name: "signup",
          builder: (c, s) => const SignUpScreen()),
      ShellRoute(
        navigatorKey: shellDahsboardNavigatorKey,
        builder: (ctx, s, c) {
          return DashboardScreen(child: c);
        },
        routes: <RouteBase>[
          /// The first screen to display in the bottom navigation bar.
          GoRoute(
            path: '/dashboard',
            name: "dashboard",
            pageBuilder: renderCustomTransition(const HomeScreen())
          ),
          GoRoute(
            path: '/cart',
            name: "cart",
            pageBuilder: renderCustomTransition(const CartScreen()),
          ),
          GoRoute(
            path: '/chat',
            name: "chat",
            pageBuilder: renderCustomTransition(const ChatScreen()),
          ),
          GoRoute(
            path: '/profile',
            name: "profile",
            pageBuilder: renderCustomTransition(const ProfileScreen()),
          ),
        ],
      ),
    ]);
