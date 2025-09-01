import 'package:admin_dashboard/presentations/users/presentation/models/user_state_model.dart';

class DropDownDesicionModel {
  final List<ChoiseStateModel> _desicionList = [
    ChoiseStateModel(id: 0, state: 'accept'),
    ChoiseStateModel(id: 1, state: 're study'),
  ];
  final List<ChoiseStateModel> _propertyDesicionList = [
    ChoiseStateModel(id: 0, state: 'sold'),
    ChoiseStateModel(id: 1, state: 'new study'),
    ChoiseStateModel(id: 2, state: 'view on stage'),
  ];

  final List<ChoiseStateModel> _propertyTypesList = [
    ChoiseStateModel(id: 0, state: 'Owned'),
    ChoiseStateModel(id: 1, state: 'Sold'),
    ChoiseStateModel(id: 2, state: 'Viewed'),
  ];

  final List<ChoiseStateModel> _transferRequests = [
    ChoiseStateModel(id: 0, state: 'Bank'),
    ChoiseStateModel(id: 1, state: 'Pyramid'),
    ChoiseStateModel(id: 2, state: 'Western Union'),
    ChoiseStateModel(id: 3, state: 'Crypto'),
    ChoiseStateModel(id: 4, state: 'Manual'),
  ];

  final List<ChoiseStateModel> _desicionMoneyRequestList = [
    ChoiseStateModel(id: 0, state: 'accept'),
    ChoiseStateModel(id: 1, state: 'reject'),
  ];

  List<ChoiseStateModel> getDesicionList() => _desicionList;
  List<ChoiseStateModel> getPropertyDesicionList() => _propertyDesicionList;
  List<ChoiseStateModel> getPropertyTypesList() => _propertyTypesList;
  List<ChoiseStateModel> getTransferRequestsList() => _transferRequests;
  List<ChoiseStateModel> getDesicionMoneyRequestList() =>
      _desicionMoneyRequestList;
}
