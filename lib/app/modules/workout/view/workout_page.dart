import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view/exercise_page.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_screen_custom_clipper.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/utils/app_drawer.dart';

class WorkoutPage extends StatelessWidget {
  static const String route = '/workout';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQuery.size.width * 0.4,
                    child: ClipPath(
                      clipper: WorkoutScreenCustomCilipper(),
                      child: const Image(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHJ1bm5pbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Corrida',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'Sábado',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 243, 219, 4),
                                ),
                              ),
                              onPressed: () =>
                                  Modular.to.pushNamed(ExercisePage.route),
                              child: const Text('Exercícios'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
