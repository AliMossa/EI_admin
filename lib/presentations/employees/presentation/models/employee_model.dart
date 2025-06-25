import 'package:admin_dashboard/presentations/employees/presentation/models/drop_down_model.dart';

class EmployeeModel {
  final List<DropDownModel> _employeesList = [
    DropDownModel(name: 'Expert Team', id: 0),
    DropDownModel(name: 'Lawyer Team', id: 1),
  ];
  final List<DropDownModel> _employeesStatus = [
    DropDownModel(name: 'Active', id: 1),
    DropDownModel(name: 'Non Active', id: 0),
  ];
  List<DropDownModel> getEmployeesTeams() => _employeesList;
  List<DropDownModel> getEmployeesStatus() => _employeesStatus;
}
