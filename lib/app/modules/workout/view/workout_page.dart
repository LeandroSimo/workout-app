import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/home/controller/home_store.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_card.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/utils/app_drawer.dart';
import 'package:my_workout/app/utils/custom_future_builder.dart';

class WorkoutPage extends StatefulWidget {
  static const String route = '/workout';

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final WorkoutStore _workoutStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinos'),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed(
              WorkoutManagementPage.route,
              arguments: {'title': 'Novo Treino'},
            ),
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
          CustomFutureBuilder<List<Workout>>(
            future: _workoutStore.getWorkout(),
            onEmpty: (context) => const Center(
              child: Text('Não há treinos cadastrados!'),
            ),
            onComplete: (context) => Observer(
              builder: (_) => ListView.builder(
                itemCount: _workoutStore.workouts.length,
                itemBuilder: (BuildContext context, int index) {
                  var _work = _workoutStore.workouts[index];
                  return WorkoutCard(
                    _work.id.toString(),
                    _work.imageUrl.toString(),
                    _work.name.toString(),
                    _work.weekDay!.round(),
                  );
                },
              ),
            ),
            onError: (context, error) => Center(
              child: Text(
                error.message,
              ),
            ),
            onLoading: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}
