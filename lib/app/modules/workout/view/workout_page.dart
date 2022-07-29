import 'package:flutter/material.dart';
import 'package:my_workout/app/utils/app_drawer.dart';

class WorkoutPage extends StatelessWidget {
  static const route = '/treinos';
  @override
  Widget build(BuildContext context) {
    var value = ModalRoute.of(context)?.settings.arguments;
    print(value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinos'),
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
          )
        ],
      ),
    );
  }
}
