import 'package:admin_dashboard/presentations/employees/presentation/models/drop_down_model.dart';

class CitiesModel {
  final List<DropDownModel> _citiesList = [
    DropDownModel(id: 0, name: 'Damascuse'),
    DropDownModel(id: 1, name: 'Latakia'),
    DropDownModel(id: 2, name: 'Homs'),
    DropDownModel(id: 3, name: 'Hamah'),
    DropDownModel(id: 4, name: 'Tartus'),
    DropDownModel(id: 5, name: 'Aleppo'),
    DropDownModel(id: 6, name: 'Raqqa'),
    DropDownModel(id: 7, name: 'Deir ez-Zor'),
    DropDownModel(id: 8, name: 'Al Hasakah'),
    DropDownModel(id: 9, name: 'Daraa'),
    DropDownModel(id: 10, name: 'Al Suwayda'),
    DropDownModel(id: 11, name: 'Al Quneitra'),
    DropDownModel(id: 12, name: 'Idlib'),
  ];
  List<DropDownModel> getCities() => _citiesList;
}
