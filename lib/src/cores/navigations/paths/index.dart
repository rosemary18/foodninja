import './path_dashboard.dart';

import './parts.dart';

class Paths {

  final Route login;
  final Route root;
  final RouteDashboard dashboard;

  const Paths({
      this.root = const Route(name: "intro", path: "/"),
      this.login = const Route(name: "login", path: "/login"),
      this.dashboard = const RouteDashboard(name: "dashboard", path: "/dashboard")
  });
}

const Paths routePaths = Paths();
