import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/home/view/home_page.dart';
import 'package:my_workout/app/modules/workout/view/workout_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(29, 36, 41, 0.8),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: const Text('Home'),
              onTap: () => Modular.to.pushReplacementNamed(HomePage.route),
            ),
            ListTile(
              leading: Icon(
                Icons.fitness_center,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: const Text('Treinos'),
              onTap: () =>
                  Modular.to.pushNamed(WorkoutPage.route, arguments: 'Treinos'),
            ),
          ],
        ),
      ),
    );
  }
}
