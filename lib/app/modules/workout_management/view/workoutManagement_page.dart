import 'package:flutter_mobx/flutter_mobx.dart';
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
            builder: (_) => Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Imagem URL'),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    DropdownButtonHideUnderline(
                      child: Container(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        padding: const EdgeInsets.all(15),
                        child: DropdownButton(
                          items: store.dropDownOptions
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e['name'].toString()),
                                  value: e['id'],
                                ),
                              )
                              .toList(),
                          onChanged: (_) {},
                          hint: Text(
                            'Dia da Semana',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.color),
                          ),
                          icon: const Icon(Icons.calendar_today),
                          isExpanded: true,
                          iconEnabledColor:
                              Theme.of(context).colorScheme.primary,
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.subtitle1?.fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                          ),
                          dropdownColor: const Color.fromRGBO(48, 56, 62, 9.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
