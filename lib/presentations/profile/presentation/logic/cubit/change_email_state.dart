part of 'change_email_cubit.dart';

sealed class ChangeEmailState extends Equatable {
  const ChangeEmailState();

  @override
  List<Object> get props => [];
}

final class ChangeEmailInitial extends ChangeEmailState {}

class UpdateEmailFieldProfileState extends ChangeEmailState {}

class SaveEmailFieldProfileState extends ChangeEmailState {}
