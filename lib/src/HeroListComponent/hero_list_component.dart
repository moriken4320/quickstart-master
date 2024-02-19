import 'dart:html';

import 'package:angular_app/src/hero_service.dart';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import '../hero.dart';
import '../route_paths.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [
    coreDirectives
  ],
  providers: [],
  pipes: [commonPipes]
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes = <Hero>[];
  Hero? selected;

  HeroListComponent(this._heroService, this._router);

  void onSelect(Hero hero) => selected = hero;

  void ngOnInit() => _getHeroes();

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
  
  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected!.id));

  Future<void> add(InputElement event) async {
    final String? name = event.value?.trim();
    if (name == null || name.isEmpty) return;
    heroes.add(await _heroService.create(name));
    selected = null;
    event.value = "";
  }

  Future<void> delete(Hero hero, Event event) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selected == hero) selected = null;

    // This makes any component **above** <my-hero>
    event.stopPropagation();
  }

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }
}
