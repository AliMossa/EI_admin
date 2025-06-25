import 'package:admin_dashboard/presentations/requests/presentaiton/models/desicion_model.dart';

class DropDownDesicionModel {
  final List<DesicionModel> _desicionList = [
    DesicionModel(id: 0, name: 'accept'),
    DesicionModel(id: 1, name: 're-study'),
  ];
  final List<DesicionModel> _propertyDesicionList = [
    DesicionModel(id: 0, name: 'sold'),
    DesicionModel(id: 1, name: 'new-study'),
  ];

  final List<DesicionModel> _propertyTypesList = [
    DesicionModel(id: 0, name: 'Owned'),
    DesicionModel(id: 1, name: 'Sold'),
  ];

  List<DesicionModel> getDesicionList() => _desicionList;
  List<DesicionModel> getPropertyDesicionList() => _propertyDesicionList;
  List<DesicionModel> getPropertyTypesList() => _propertyTypesList;
}
