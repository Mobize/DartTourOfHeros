import 'package:angular/angular.dart';
import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart'; // importation du service

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html' ,
  directives: [coreDirectives, HeroComponent],
  styleUrls: ['app_component.css'],
  providers: [ClassProvider(HeroService)],// declaration du service
)
class AppComponent implements OnInit{
  final title = 'Tour of heroes';
  List<Hero> heroes;
  Hero selected;

  void onSelect(Hero hero) => selected = hero;

  final HeroService _heroService; // variable privée du service
  AppComponent(this._heroService); // injection de depandance dans le constructeur

  Future<void> _getHeroes() async {
  heroes = await _heroService.getAll();
}

  void ngOnInit() => _getHeroes();
}


 
 