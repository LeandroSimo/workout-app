import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';
import 'package:flutter/material.dart';

class WorkoutManagementPage extends StatefulWidget {
  static const String route = '/workout-management';
  const WorkoutManagementPage({
    Key? key,
  }) : super(key: key);
  @override
  WorkoutManagementPageState createState() => WorkoutManagementPageState();
}

class WorkoutManagementPageState extends State<WorkoutManagementPage> {
  final WorkoutManagementStore _store = WorkoutManagementStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Observer(
                builder: (_) => Text(_store.arguments['title'].toString()))),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/bg2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}
