part of 'show_password_cubit.dart';

sealed class ShowPasswordState extends Equatable {
  const ShowPasswordState();

  @override
  List<Object> get props => [];
}

final class ShowPasswordInitial extends ShowPasswordState {}

class DoShowPasswordState extends ShowPasswordState {}

class UnDoShowPasswordState extends ShowPasswordState {}
