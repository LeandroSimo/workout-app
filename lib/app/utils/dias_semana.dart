class DiasSemana {
  static String? getWeekdayName(int day) {
    Map<int, String> weekDay = {
      1: 'Domingo',
      2: 'Segunda-feira',
      3: 'Terça-feira',
      4: 'Quarta-feira',
      5: 'Quinta-feira',
      6: 'Sexta-feira',
      7: 'Sábado',
    };
    return weekDay[day];
  }
}
