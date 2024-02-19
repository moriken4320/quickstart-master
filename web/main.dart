import 'package:angular_app/in_memory_data_service.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  // ClassProvider(BrowserClient)
  ClassProvider(Client, useClass: InMemoryDataService),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
