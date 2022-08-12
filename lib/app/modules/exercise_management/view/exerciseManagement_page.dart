import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_workout/app/modules/exercise_management/controller/exerciseManagement_store.dart';

class ExerciseManagementPage extends StatefulWidget {
  static const String route = '/exercise-management';
  const ExerciseManagementPage({
    Key? key,
  }) : super(key: key);
  @override
  ExerciseManagementPageState createState() => ExerciseManagementPageState();
}

class ExerciseManagementPageState extends State<ExerciseManagementPage> {
  final ExerciseManagementStore _store = ExerciseManagementStore();
  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_arguments.toString()),
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
                key: _store.formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,
                      validator: (value) => value!.length < 3
                          ? 'O neme deve contar pelo menos 3 caracteres'
                          : null,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_store.imageFocus),
                    ),
                    TextFormField(
                      focusNode: _store.imageFocus,
                      decoration: const InputDecoration(labelText: 'Imgem URL'),
                      textInputAction: TextInputAction.next,
                      validator: (value) => value!.startsWith('https://') ||
                              value.startsWith('http://')
                          ? null
                          : 'O endereço de imagem deve começar com HTTPS:// ou HTTP://',
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_store.descriptionFocus),
                    ),
                    TextFormField(
                      focusNode: _store.descriptionFocus,
                      maxLength: 200,
                      minLines: 3,
                      maxLines: 5,
                      buildCounter: (_,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
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
          )
        ],
      ),
    );
  }
}
