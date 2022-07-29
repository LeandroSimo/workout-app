import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';
import 'package:flutter/material.dart';

class WorkoutManagementPage extends StatefulWidget {
  static const String route = '/workout-management';
  const WorkoutManagementPage({
    Key? key,
  }) : super(key: key);
  @override
  WorkoutManagementPageState createState() => WorkoutManagementPageState();
}

class WorkoutManagementPageState extends State<WorkoutManagementPage> {
  final WorkoutManagementStore store = WorkoutManagementStore();
  final List<Map<String, Object>> dropDown = [
    {'id': 1, 'name': 'Domingo'},
    {'id': 2, 'name': 'Segunda-feira'},
    {'id': 3, 'name': 'Terça-feira'},
    {'id': 4, 'name': 'Quarta-feira'},
    {'id': 5, 'name': 'Quinta-feira'},
    {'id': 6, 'name': 'Sexta-feira'},
    {'id': 7, 'name': 'Sábado'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Observer(
              builder: (_) => Text(store.arguments['title'].toString()))),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Observer(
            builder: (_) => Form(
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Imagem URL'),
                  ),
                  DropdownButton(
                    items: store.dropDownOptions
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e['name'].toString()),
                            value: e['id'],
                          ),
                        )
                        .toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
