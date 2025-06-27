part of 'monies_rates_bloc.dart';

sealed class MoniesRatesState extends Equatable {
  const MoniesRatesState();

  @override
  List<Object> get props => [];
}

final class MoniesRatesInitial extends MoniesRatesState {}

class LoadingGetAllMoniesRatesState extends MoniesRatesState {}

class SuccessGetAllMoniesRatesState extends MoniesRatesState {}

// ignore: must_be_immutable
class FailedGetAllMoniesRatesState extends MoniesRatesState {
  String message = '';
  FailedGetAllMoniesRatesState({required this.message});
}
