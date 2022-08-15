import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/exercise_module.dart';
import 'package:my_workout/app/modules/exercise/view/exercise_page.dart';
import 'package:my_workout/app/modules/exercise_management/exerciseManagement_module.dart';
import 'package:my_workout/app/modules/exercise_management/view/exerciseManagement_page.dart';
import 'package:my_workout/app/modules/home/view/home_page.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/view/workout_page.dart';
import 'package:my_workout/app/modules/workout/workout_module.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/modules/workout_management/workoutManagement_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Workout Stores
    Bind((i) => WorkoutStore()),
    Bind((i) => WorkoutManagementStore()),
    //Exercise Store
    Bind((i) => ExerciseStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(HomePage.route, module: HomeModule()),
    ModuleRoute(WorkoutPage.route, module: WorkoutModule()),
    ModuleRoute(WorkoutManagementPage.route, module: WorkoutManagementModule()),
    ModuleRoute(ExercisePage.route, module: ExerciseModule()),
    ModuleRoute(ExerciseManagementPage.route,
        module: ExerciseManagementModule()),
  ];
}
