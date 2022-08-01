import 'package:my_workout/app/modules/exercise_management/controller/exerciseManagement_store.dart';
import 'package:my_workout/app/modules/exercise_management/view/exerciseManagement_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExerciseManagementModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExerciseManagementStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ExerciseManagementPage()),
  ];
}
