import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_list.dart';
import 'package:my_workout/app/modules/home/controller/home_store.dart';
import 'package:my_workout/app/modules/home/view_models/button_bar_base.dart';
import 'package:my_workout/app/modules/home/view_models/today_workout.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';
import 'package:my_workout/app/utils/app_drawer.dart';
import 'package:my_workout/app/utils/custom_future_builder.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final WorkoutStore _workoutStore = Modular.get();
  final Workout _workout = Workout();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/bg3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: CustomFutureBuilder<List<Workout>>(
                    future: _workoutStore.getWorkout(),
                    onEmpty: (context) => const SizedBox(),
                    onLoading: (context) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    onComplete: (context) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: _workoutStore.workouts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final _works = _workoutStore.workouts[index];
                        final _today = _workoutStore.workouts.indexWhere(
                            (element) => element.weekDay == _works.weekDay);
                        if (_today != -1) {
                          return TodayWorkout(
                            _works.name.toString(),
                            _works.imageUrl.toString(),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'Nenhum treinamento encontrado para o dia selecionado.',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                    ),
                    onError: (context, error) => Center(
                      child: Text(
                        error.message,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ExerciseList(
                    _workout.id.toString(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ButtonBarBase(),
            ),
          ),
        ],
      ),
    );
  }
}
