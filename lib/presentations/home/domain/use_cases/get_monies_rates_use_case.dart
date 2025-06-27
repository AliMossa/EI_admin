import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/repositories/home_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetMoniesRatesUseCase {
  HomeRepository homeRepository;
  GetMoniesRatesUseCase({required this.homeRepository});

  Future<Either<ServerAdminException, MoniesRatesEntity>> call() async {
    return await homeRepository.getMoniesRates();
  }
}
