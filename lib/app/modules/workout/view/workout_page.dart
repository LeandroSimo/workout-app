import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_card.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/utils/app_drawer.dart';

class WorkoutPage extends StatelessWidget {
  static const String route = '/workout';
  final WorkoutStore _workoutStore = WorkoutStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinos'),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed(WorkoutManagementPage.route),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder<List<Workout>>(
            future: _workoutStore.getWorkout(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Workout>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Observer(
                      builder: (_) => ListView.builder(
                        itemCount: _workoutStore.workouts.length,
                        itemBuilder: (BuildContext context, int index) {
                          var _work = _workoutStore.workouts[index];
                          return WorkoutCard(
                            _work.imageUrl.toString(),
                            _work.name.toString(),
                            _work.weekDay!.round(),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Error de Conexão'),
                    );
                  }
                default:
                  return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
