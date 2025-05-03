part of 'date_cubit.dart';

sealed class DateState extends Equatable {
  const DateState();

  @override
  List<Object> get props => [];
}

final class DateInitial extends DateState {}

// ignore: must_be_immutable
class SetDateState extends DateState {}

class LoadingSetDateState extends DateState {}
