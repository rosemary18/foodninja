import './parts.dart';

class RouteDashboard {
  final String name;
  final String path;
  final RouteDashboardBranch branch;

  const RouteDashboard({
    required this.name,
    required this.path,
    this.branch = const RouteDashboardBranch()
  });
}

class RouteDashboardBranch {

  final Route home;
  final Route profile;
  final Route cart;
  final Route chat;

  const RouteDashboardBranch({
    this.home = const Route(name: "home", path: "/home"),
    this.profile = const Route(name: "home", path: "/home"),
    this.cart = const Route(name: "home", path: "/home"),
    this.chat = const Route(name: "home", path: "/home"),
  });
}
