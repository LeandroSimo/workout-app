import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorkoutManagementModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WorkoutManagementStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WorkoutManagementPage()),
  ];
}
