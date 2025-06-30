import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'statistics_date_state.dart';

class StatisticsDateCubit extends Cubit<StatisticsDateState> {
  HomeMiddleware homeMiddleware;
  StatisticsDateCubit({required this.homeMiddleware})
    : super(StatisticsDateInitial());

  void setStatististicsDate() {
    emit(LoadingSetStatisticsDateState());
    emit(SetStatisticsDateState());
  }
}
