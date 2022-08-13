import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/home/controller/home_store.dart';
import 'package:my_workout/app/utils/dias_semana.dart';

class ButtonBarBase extends StatefulWidget {
  @override
  State<ButtonBarBase> createState() => _ButtonBarBaseState();
}

class _ButtonBarBaseState extends State<ButtonBarBase> {
  final _homeStore = Modular.get<HomeStore>();

  List<OutlinedButton> getButtonBar() {
    List<OutlinedButton> _list = [];

    for (int i = 1; i < 8; i++) {
      final dia = DiasSemana.getWeekdayName(i).toString();

      final ButtonStyle _outlinedButtonStyle = OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: const BorderSide(
          style: BorderStyle.solid,
          color: Color.fromARGB(255, 243, 219, 4),
        ),
        backgroundColor: _homeStore.weekDay == i
            ? Color.fromARGB(255, 243, 219, 4)
            : Colors.transparent,
      );
      _list.add(
        OutlinedButton(
          onPressed: () {
            setState(() {
              _homeStore.weekDay = i;
            });
          },
          child: Text(
            dia.substring(0, 3).toUpperCase(),
            style: TextStyle(
              color: _homeStore.weekDay == i
                  ? Colors.black
                  : Color.fromARGB(255, 243, 219, 4),
            ),
          ),
          style: _outlinedButtonStyle,
        ),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: getButtonBar(),
    );
  }
}
