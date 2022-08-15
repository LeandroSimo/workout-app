import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/exercise_management/controller/exerciseManagement_store.dart';

class ExerciseManagementPage extends StatefulWidget {
  static const String route = '/exercise-management';
  @override
  ExerciseManagementPageState createState() => ExerciseManagementPageState();
}

class ExerciseManagementPageState extends State<ExerciseManagementPage> {
  final _exerciseManagenment = Modular.get<ExerciseManagementStore>();

  ReactionDisposer? disposerInit;
  ReactionDisposer? disposerSaved;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposerInit = reaction((_) => _exerciseManagenment.isInit, (isInit) {
      if (isInit == true) {
        final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
        _exerciseManagenment.exercise.workoutId = _arguments['workoutId'];
      }
      isInit = false;
    });

    disposerSaved = reaction((_) => _exerciseManagenment.onSaved, (onSaved) {
      onSaved == true ? Modular.to.pop() : onSaved;
    });
  }

  @override
  void dispose() {
    disposerInit!();
    disposerSaved!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(_arguments['title']),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _exerciseManagenment.formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      onChanged: _exerciseManagenment.setName,
                      decoration: const InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,
                      validator: (value) => value!.length < 3
                          ? 'O neme deve contar pelo menos 3 caracteres'
                          : null,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_exerciseManagenment.imageFocus),
                    ),
                    TextFormField(
                      onChanged: _exerciseManagenment.setImgUrl,
                      focusNode: _exerciseManagenment.imageFocus,
                      decoration: const InputDecoration(labelText: 'Imgem URL'),
                      textInputAction: TextInputAction.next,
                      validator: (value) => value!.startsWith('https://') ||
                              value.startsWith('http://')
                          ? null
                          : 'O endereço de imagem deve começar com HTTPS:// ou HTTP://',
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_exerciseManagenment.descriptionFocus),
                    ),
                    TextFormField(
                      onChanged: _exerciseManagenment.setDescription,
                      focusNode: _exerciseManagenment.descriptionFocus,
                      maxLength: 200,
                      minLines: 3,
                      maxLines: 5,
                      buildCounter: (
                        _, {
                        required currentLength,
                        required isFocused,
                        maxLength,
                      }) =>
                          Text(
                        '$currentLength/$maxLength',
                        style: const TextStyle(color: Colors.white),
                      ),
                      decoration: const InputDecoration(labelText: 'Descrição'),
                      validator: (value) => value!.length < 5
                          ? 'A descrição deve conter no mínimo 5 caracteres'
                          : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _exerciseManagenment.save,
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
          )
        ],
      ),
    );
  }
}
