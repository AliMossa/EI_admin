import 'package:admin_dashboard/presentations/search/domain/entities/search_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchRequestEntity extends Equatable {
  String token;
  SearchEntity searchEntity;
  SearchRequestEntity({required this.token, required this.searchEntity});
  @override
  List<Object?> get props => [token, searchEntity];
}
