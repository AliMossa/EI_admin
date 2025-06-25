part of 'check_code_bloc.dart';

sealed class CheckCodeState extends Equatable {
  const CheckCodeState();

  @override
  List<Object> get props => [];
}

final class CheckCodeInitial extends CheckCodeState {}

class LoadingVerifyCodeState extends CheckCodeState {}

class SuccessVerifyCodeState extends CheckCodeState {}

// ignore: must_be_immutable
class FailedVerifyCodeState extends CheckCodeState {
  String message;
  FailedVerifyCodeState({required this.message});
}
