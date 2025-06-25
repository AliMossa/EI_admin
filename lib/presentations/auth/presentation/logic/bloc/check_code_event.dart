part of 'check_code_bloc.dart';

sealed class CheckCodeEvent extends Equatable {
  const CheckCodeEvent();

  @override
  List<Object> get props => [];
}

class VerifyCodeEvent extends CheckCodeEvent {}
