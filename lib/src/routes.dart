import 'package:angular_router/angular_router.dart';
import 'dashboard_component.template.dart' as dashboard_template;
import 'route_paths.dart';
import 'hero_list_component.template.dart' as hero_list_template;

export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    heroes,
    dashboard,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}