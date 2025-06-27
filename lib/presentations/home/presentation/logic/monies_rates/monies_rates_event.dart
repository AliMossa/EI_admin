part of 'monies_rates_bloc.dart';

sealed class MoniesRatesEvent extends Equatable {
  const MoniesRatesEvent();

  @override
  List<Object> get props => [];
}

class GetAllMoniesRatesEvent extends MoniesRatesEvent {}
