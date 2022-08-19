import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/model/exercise.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_list.dart';
import 'package:my_workout/app/modules/home/controller/home_store.dart';
import 'package:my_workout/app/modules/home/view_models/today_workout.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';
import 'package:my_workout/app/utils/app_drawer.dart';
import 'package:my_workout/app/utils/custom_future_builder.dart';
import 'package:my_workout/app/utils/dias_semana.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final WorkoutStore _workoutStore = Modular.get();
  // final Workout _workout = Workout();
  final ExerciseStore _exerciseStore = Modular.get();

  int _weekDay = DateTime.now().weekday;

  List<OutlinedButton> _getButtonBar() {
    List<OutlinedButton> _list = [];

    for (int i = 1; i < 8; i++) {
      final dia = DiasSemana.getWeekdayName(i).toString();

      final ButtonStyle _outlinedButtonStyle = OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: const BorderSide(
          style: BorderStyle.solid,
          color: Color.fromARGB(255, 243, 219, 4),
        ),
        backgroundColor: _weekDay == i
            ? Color.fromARGB(255, 243, 219, 4)
            : Colors.transparent,
      );
      _list.add(
        OutlinedButton(
          onPressed: () {
            setState(() {
              _weekDay = i;
            });
          },
          child: Text(
            dia.substring(0, 3).toUpperCase(),
            style: TextStyle(
              color: _weekDay == i
                  ? Colors.black
                  : Color.fromARGB(255, 243, 219, 4),
            ),
          ),
          style: _outlinedButtonStyle,
        ),
      );
    }
    return _list;
  }

  Widget _getTodayWorkout(List<Workout> workout) {
    final index = _workoutStore.workouts
        .indexWhere((element) => element.weekDay == _weekDay);
    if (index != -1) {
      final _workoutElement = _workoutStore.workouts[index];
      return TodayWorkout(
          _workoutElement.name.toString(), _workoutElement.imageUrl.toString());
    } else {
      return const Center(
        child: Text('Nenhum treinamento encontrado para o dia selecionado!'),
      );
    }
  }

  Widget _getExerciseList(List<Exercise> workout) {
    final index = _workoutStore.workouts
        .indexWhere((element) => element.weekDay == _weekDay);
    if (index != -1) {
      final _workoutElement = _workoutStore.workouts[index];
      return ExerciseList(_workoutElement.id.toString());
    } else {
      return const Center(
        child: Text(''),
      );
    }
  }

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
                    onComplete: (context) => ListView(
                      children: [_getTodayWorkout(_workoutStore.workouts)],
                      shrinkWrap: true,
                      // itemCount: _workoutStore.workouts.length,
                      // itemBuilder: (BuildContext context, int index) {
                      //   return _getTodayWorkout(_workoutStore.workouts);
                      // },
                    ),
                    onError: (context, error) => Center(
                      child: Text(
                        error.message,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _getExerciseList(_exerciseStore.exercises),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ButtonBar(
                children: _getButtonBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
