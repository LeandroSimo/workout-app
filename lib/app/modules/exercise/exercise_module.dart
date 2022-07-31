import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view/exercise_page.dart';

class ExerciseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExerciseStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ExercisePage()),
  ];
}
