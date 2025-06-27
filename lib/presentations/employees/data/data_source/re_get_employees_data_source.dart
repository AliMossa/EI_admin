import 'package:admin_dashboard/presentations/employees/domain/entities/employee_enitity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class ReGetEmployeesDataSource {
  Future<TotalEmployeesEntity> reGetEmployees(String link);
}

class ReGetEmployeesDataSourceWithDio extends ReGetEmployeesDataSource {
  ReGetEmployeesDataSourceWithDio? _reGetEmployeesDataSourceWithDio;
  ReGetEmployeesDataSourceWithDio get() =>
      _reGetEmployeesDataSourceWithDio ??
      (_reGetEmployeesDataSourceWithDio = ReGetEmployeesDataSourceWithDio());
  @override
  Future<TotalEmployeesEntity> reGetEmployees(String link) async {
    String message = '';
    List<EmployeeEnitity> list = [];

    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        print(item);
        list.add(
          EmployeeEnitity(
            id: item['id'],
            roleId: item['role_id'],
            name: item['name'],
            joinedDate: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),
          ),
        );
      }
      return TotalEmployeesEntity(employees: list, nextPage: '');
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
