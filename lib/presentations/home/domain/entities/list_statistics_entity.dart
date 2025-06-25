import 'package:admin_dashboard/presentations/home/domain/entities/statistics_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ListStatisticsEntity extends Equatable {
  List<StatisticsEntity> statics;
  ListStatisticsEntity({required this.statics});
  @override
  List<Object?> get props => [statics];
}
