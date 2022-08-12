import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise_management/view/exerciseManagement_page.dart';

class ExercisePage extends StatelessWidget {
  static const String route = '/exercise';
  const ExercisePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title:  Text(_arguments.toString()),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed(
              ExerciseManagementPage.route,
              arguments: 'Cadastrar Novo Exercício',
            ),
            icon: const Icon(Icons.add),
          )
        ],
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
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Card(
              child: ListTile(
                title: const Text(
                  '40 minutos de corrida',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Velocidade constante de corrida por 40 minutos',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2?.color,
                  ),
                ),
                leading: Image.network(
                  'https://img.icons8.com/bubbles/2x/timer.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
