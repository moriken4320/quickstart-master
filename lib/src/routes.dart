import 'package:ngrouter/ngrouter.dart';

import 'route_paths.dart';
import 'HeroListComponent/hero_list_component.template.dart'
    as hero_list_template;
import 'DashboardComponent/dashboard_component.template.dart'
    as dashboard_template;
import 'HeroComponent/hero_component.template.dart' as hero_template;

export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
    // useAsDefault: true,  <- これでルートパスのときにこのコンポーネントを表示する
  );
  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    hero,
    heroes,
    dashboard,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
