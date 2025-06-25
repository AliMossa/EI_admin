part of 'set_email_bloc.dart';

sealed class SetEmailEvent extends Equatable {
  const SetEmailEvent();

  @override
  List<Object> get props => [];
}

class SendVerificationCodeEvent extends SetEmailEvent {}
