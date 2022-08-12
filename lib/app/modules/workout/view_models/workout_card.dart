import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view/exercise_page.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_screen_custom_clipper.dart';
import 'package:my_workout/app/modules/workout_management/view/workoutManagement_page.dart';
import 'package:my_workout/app/utils/dias_semana.dart';

class WorkoutCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int weekDay;
  WorkoutCard(this.id, this.imageUrl, this.name, this.weekDay);
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(WorkoutManagementPage.route,
            arguments: {'title': 'Editar $name', 'id': id});
      },
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
                child: Image(
                  image: NetworkImage(imageUrl),
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
                    name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    DiasSemana.getWeekdayName(weekDay).toString(),
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
                        onPressed: () => Modular.to.pushNamed(
                            ExercisePage.route,
                            arguments: 'Exercicios Cadastrados'),
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
    );
  }
}
