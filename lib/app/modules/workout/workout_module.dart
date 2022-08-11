import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/view/workout_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_card.dart';

class WorkoutModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WorkoutStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WorkoutPage()),
  ];
}
