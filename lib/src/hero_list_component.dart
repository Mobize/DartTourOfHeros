import 'package:angular/angular.dart';
import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart'; // importation du service

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html' ,
  directives: [coreDirectives, HeroComponent],
  styleUrls: ['hero_list_component.css'],
  providers: [ClassProvider(HeroService)],// declaration du service
)
class HeroListComponent implements OnInit{
  final title = 'Tour of heroes';
  List<Hero> heroes;
  Hero selected;

  void onSelect(Hero hero) => selected = hero;

  final HeroService _heroService; // variable privée du service
  HeroListComponent(this._heroService); // injection de depandance dans le constructeur

  Future<void> _getHeroes() async {
  heroes = await _heroService.getAll();
}

  void ngOnInit() => _getHeroes();
}


 
 