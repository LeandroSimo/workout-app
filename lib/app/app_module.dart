import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/home/view/home_page.dart';
import 'package:my_workout/app/modules/workout/view/workout_page.dart';
import 'package:my_workout/app/modules/workout/workout_module.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/modules/workout_management/workoutManagement_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(HomePage.route, module: HomeModule()),
    ModuleRoute(WorkoutPage.route, module: WorkoutModule()),
    ModuleRoute(WorkoutManagementPage.route, module: WorkoutManagementModule()),
  ];
}
