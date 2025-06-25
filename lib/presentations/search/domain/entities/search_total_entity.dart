import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchTotalEntity extends Equatable {
  String link;
  List<SearchResultEntity> list;
  SearchTotalEntity({required this.link, required this.list});
  factory SearchTotalEntity.init() => SearchTotalEntity(link: '', list: []);
  @override
  List<Object?> get props => [link, list];
}
