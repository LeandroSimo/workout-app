// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<int>? _$weewDayNowComputed;

  @override
  int get weewDayNow =>
      (_$weewDayNowComputed ??= Computed<int>(() => super.weewDayNow,
              name: 'HomeStoreBase.weewDayNow'))
          .value;

  late final _$weekDayAtom =
      Atom(name: 'HomeStoreBase.weekDay', context: context);

  @override
  int get weekDay {
    _$weekDayAtom.reportRead();
    return super.weekDay;
  }

  @override
  set weekDay(int value) {
    _$weekDayAtom.reportWrite(value, super.weekDay, () {
      super.weekDay = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setWeekDay(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setWeekDay');
    try {
      return super.setWeekDay(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weekDay: ${weekDay},
weewDayNow: ${weewDayNow}
    ''';
  }
}
