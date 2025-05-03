part of 'change_number_cubit.dart';

sealed class ChangeNumberState extends Equatable {
  const ChangeNumberState();

  @override
  List<Object> get props => [];
}

final class ChangeNumberInitial extends ChangeNumberState {}

class UpdateNumberFieldProfileState extends ChangeNumberState {}

class SaveNumberFieldProfileState extends ChangeNumberState {}
