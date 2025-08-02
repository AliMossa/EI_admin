import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestEconomicInfoEntity extends Equatable {
  int numberOfChances;
  int profitPercent;
  String expectedPrice;
  String totalExpectedTaxes;
  String buyingPrice;
  String? rentingPrice;
  String chancePrice;
  String investmentTime;
  String incommingTime;
  String investmentMode;
  String propertyManagement;
  String? agreedNegotiation;
  RequestEconomicInfoEntity({
    required this.numberOfChances,
    required this.profitPercent,
    required this.expectedPrice,
    required this.buyingPrice,
    required this.totalExpectedTaxes,
    required this.rentingPrice,
    required this.chancePrice,
    required this.investmentTime,
    required this.incommingTime,
    required this.investmentMode,
    required this.propertyManagement,
    required this.agreedNegotiation,
  });
  factory RequestEconomicInfoEntity.init() => RequestEconomicInfoEntity(
    numberOfChances: -1,
    profitPercent: -1,
    expectedPrice: '',
    buyingPrice: '',
    totalExpectedTaxes: '',
    rentingPrice: '',
    chancePrice: '',
    investmentTime: '',
    incommingTime: '',
    investmentMode: '',
    propertyManagement: '',
    agreedNegotiation: '',
  );
  @override
  List<Object?> get props => [
    numberOfChances,
    profitPercent,
    expectedPrice,
    buyingPrice,
    totalExpectedTaxes,
    rentingPrice,
    chancePrice,
    investmentTime,
    incommingTime,
    investmentMode,
    propertyManagement,
    agreedNegotiation,
  ];
}
