import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/view/workout_page.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';

class WorkoutManagementPage extends StatefulWidget {
  static const String route = '/workout-management';

  @override
  WorkoutManagementPageState createState() => WorkoutManagementPageState();
}

class WorkoutManagementPageState extends State<WorkoutManagementPage> {
  final WorkoutManagementStore _workoutManagement = Modular.get();
  // final WorkoutStore _workoutStore = Modular.get();

  ReactionDisposer? disposerCreate;
  ReactionDisposer? disposerInit;
  ReactionDisposer? disposerDelete;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposerCreate = reaction((_) => _workoutManagement.onCreate, (onCreate) {
      final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
      if (onCreate == true) {
        Modular.to.pop();
      }
      ;
    });

    disposerInit = reaction((_) => _workoutManagement.isInit, (isInit) {
      if (isInit == true) {
        final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
        if (_arguments['id'] != null) {
          _workoutManagement.workout =
              Modular.get<WorkoutStore>().getById(_arguments['id']);
          _workoutManagement.dropValue = _workoutManagement.workout.weekDay;
        }
      }
      isInit = false;
    });

    disposerDelete = reaction((_) => _workoutManagement.onDelete, (onDelete) {
      onDelete == true
          ? Modular.to.pushReplacementNamed(WorkoutPage.route)
          : onDelete;
    });
  }

  @override
  void dispose() {
    disposerCreate!();
    disposerInit!();
    disposerDelete!();
    Modular.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(_arguments['title']),
        actions: _arguments['id'] != null
            ? [
                IconButton(
                  onPressed: () =>
                      _workoutManagement.showConfirmationModal(context),
                  icon: const Icon(Icons.delete),
                ),
              ]
            : [],
      ),
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
                key: _workoutManagement.formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _workoutManagement.workout.name,
                      onChanged: _workoutManagement.setName,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_workoutManagement.imageFocus),
                      decoration: const InputDecoration(labelText: 'Nome'),
                      validator: (value) => value!.isEmpty || value.length < 3
                          ? 'O nome deve conter no mínimo 3 caracteres'
                          : null,
                    ),
                    TextFormField(
                      initialValue: _workoutManagement.workout.imageUrl,
                      onChanged: _workoutManagement.setImageUrl,
                      focusNode: _workoutManagement.imageFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_workoutManagement.dropDownFocus),
                      decoration:
                          const InputDecoration(labelText: 'Imagem URL'),
                      validator: (value) => value!.startsWith('https://') ||
                              value.startsWith('http://')
                          ? null
                          : 'O endereço de imagem deve começar com HTTPS:// ou HTTP://',
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    DropdownButtonHideUnderline(
                      child: Container(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        padding: const EdgeInsets.all(15),
                        child: DropdownButton(
                          value: _workoutManagement.dropValue,
                          focusNode: _workoutManagement.dropDownFocus,
                          items: _workoutManagement.dropDownOptions
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e['id'],
                                  child: Text(e['name'].toString()),
                                ),
                              )
                              .toList(),
                          onChanged: _workoutManagement.setDropValue,
                          hint: Text(
                            'Dia da Semana',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.subtitle2?.color,
                            ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _workoutManagement.dropValid
                            ? ''
                            : 'Selecione um dia da semana',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _workoutManagement.save,
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline6?.fontSize,
                            color: const Color.fromARGB(255, 51, 48, 48),
                          ),
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
