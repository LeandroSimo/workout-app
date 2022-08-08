import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Observer(
              builder: (_) => FutureBuilder(
                future: _workoutStore.getWorkout(),
                builder: (_, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: _workoutStore.workouts.length,
                            itemBuilder: (_, int index) => WorkoutCard(
                                  _workoutStore.workouts[index].imageUrl
                                      .toString(),
                                  _workoutStore.workouts[index].name.toString(),
                                  _workoutStore.workouts[index].weekDay!
                                      .round(),
                                ));
                      } else {
                        return const Center(
                          child: Text('Conexão Instável'),
                        );
                      }
                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
