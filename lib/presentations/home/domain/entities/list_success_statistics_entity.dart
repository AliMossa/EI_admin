import 'package:admin_dashboard/presentations/home/domain/entities/success_statistics_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ListSuccessStatisticsEntity extends Equatable {
  List<SuccessStatisticsEntity> statics;
  ListSuccessStatisticsEntity({required this.statics});

  factory ListSuccessStatisticsEntity.init() => ListSuccessStatisticsEntity(
    statics: [
      SuccessStatisticsEntity(id: 1, value: 0),
      SuccessStatisticsEntity(id: 2, value: 0),
      SuccessStatisticsEntity(id: 3, value: 0),
      SuccessStatisticsEntity(id: 4, value: 0),
      SuccessStatisticsEntity(id: 5, value: 0),
      SuccessStatisticsEntity(id: 6, value: 0),
      SuccessStatisticsEntity(id: 7, value: 0),
      SuccessStatisticsEntity(id: 8, value: 0),
      SuccessStatisticsEntity(id: 9, value: 0),
      SuccessStatisticsEntity(id: 10, value: 0),
      SuccessStatisticsEntity(id: 11, value: 0),
      SuccessStatisticsEntity(id: 12, value: 0),
    ],
  );
  @override
  List<Object?> get props => [statics];
}
