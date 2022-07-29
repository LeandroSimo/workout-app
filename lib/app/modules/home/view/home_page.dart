import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/home/controller/home_store.dart';
import 'package:my_workout/app/modules/home/view_models/today_workout.dart';
import 'package:my_workout/app/utils/app_drawer.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final HomeStore _homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/bg3.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ButtonBar(
                      children: _homeStore.getButtonBar(() {}),
                    ),
                  ),
                  TodayWorkout(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
