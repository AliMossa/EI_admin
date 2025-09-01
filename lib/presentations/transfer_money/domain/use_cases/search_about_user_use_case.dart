import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class SearchAboutUserUseCase {
  TransferMoneyRepository transferMoenyRepository;
  SearchAboutUserUseCase({required this.transferMoenyRepository});

  Future<Either<AdminExceptions, AboutUserEntity>> call(String email) async {
    return await transferMoenyRepository.searchAboutUser(email);
  }
}
