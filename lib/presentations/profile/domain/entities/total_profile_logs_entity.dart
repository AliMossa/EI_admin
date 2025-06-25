import 'package:admin_dashboard/presentations/profile/domain/entities/profile_logs_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalProfileLogsEntity extends Equatable {
  List<ProfileLogsEntity> list;
  String nextPage;
  TotalProfileLogsEntity({required this.list, required this.nextPage});
  factory TotalProfileLogsEntity.init() =>
      TotalProfileLogsEntity(list: [], nextPage: '');

  @override
  List<Object?> get props => [list, nextPage];
}
