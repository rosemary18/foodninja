import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/index.dart';

class DashboardScreen extends StatefulWidget {

  final Widget child;
  const DashboardScreen({super.key, required this.child});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {

    onTabChange(value) {
      
      setState(() {
        tabIndex = value;
      });

      switch (value) {
        case 0:
          GoRouter.of(context).goNamed('dashboard');
        case 1:
          GoRouter.of(context).goNamed('chat');
        case 2:
          GoRouter.of(context).goNamed('cart');
        case 3:
          GoRouter.of(context).goNamed('profile');
      }
    }

    return Scaffold(
      body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFF0D0D0D),
          child: widget.child,
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          child: BottomNavigation(tabIndex: tabIndex, onTabChange: onTabChange)
        )
      ],
    ));
  }
}
