import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view/exercise_page.dart';
import 'package:my_workout/app/modules/workout/view_models/workout_screen_custom_clipper.dart';

class WorkoutCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int weekDay;
  WorkoutCard(this.imageUrl, this.name, this.weekDay);
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Card(
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
                  weekDay.toString(),
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
                      onPressed: () => Modular.to.pushNamed(ExercisePage.route),
                      child: const Text('Exercícios'),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
