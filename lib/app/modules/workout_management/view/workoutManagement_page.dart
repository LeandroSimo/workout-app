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
  final WorkoutManagementStore _store = WorkoutManagementStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Observer(
              builder: (_) => Text(_store.arguments['title'].toString()))),
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
                key: _store.formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_store.imageFocus),
                      decoration: const InputDecoration(labelText: 'Nome'),
                      validator: (value) => value!.isEmpty || value.length < 3
                          ? 'O nome deve conter no mínimo 3 caracteres'
                          : null,
                    ),
                    TextFormField(
                      focusNode: _store.imageFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_store.dropDownFocus),
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
                          value: _store.dropValue,
                          focusNode: _store.dropDownFocus,
                          items: _store.dropDownOptions
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e['id'],
                                  child: Text(e['name'].toString()),
                                ),
                              )
                              .toList(),
                          onChanged: _store.setDropValue,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _store.dropValid ? '' : 'Selecione um dia da semana',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _store.save,
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline6?.fontSize,
                            color: const Color.fromARGB(255, 51, 48, 48),
                          ),
                        ),
                      ),
                    )
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
