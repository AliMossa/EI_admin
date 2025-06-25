import 'package:admin_dashboard/presentations/home/presentation/models/month_model.dart';

class ListMonthsModel {
  final List<MonthModel> _months = [
    MonthModel(id: 0, name: ''),
    MonthModel(id: 1, name: 'Jan'),
    MonthModel(id: 2, name: 'Feb'),
    MonthModel(id: 3, name: 'Mar'),
    MonthModel(id: 4, name: 'Apr'),
    MonthModel(id: 5, name: 'May'),
    MonthModel(id: 6, name: 'Jun'),
    MonthModel(id: 7, name: 'Jul'),
    MonthModel(id: 8, name: 'Aug'),
    MonthModel(id: 9, name: 'Sep'),
    MonthModel(id: 10, name: 'Oct'),
    MonthModel(id: 11, name: 'Nov'),
    MonthModel(id: 12, name: 'Dec'),
  ];

  MonthModel getCorrectMonth(int id) =>
      _months.firstWhere((item) => item.id == id);
}
