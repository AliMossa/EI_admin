import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MoniesRatesEntity extends Equatable {
  double USD;
  double SYR;
  double EUR;
  double JPY;
  double TRY;
  MoniesRatesEntity({
    required this.USD,
    required this.EUR,
    required this.JPY,
    required this.SYR,
    required this.TRY,
  });
  factory MoniesRatesEntity.init() =>
      MoniesRatesEntity(USD: 0, EUR: 0, JPY: 0, SYR: 0, TRY: 0);

  @override
  List<Object?> get props => [USD, SYR, EUR, JPY, TRY];
}
