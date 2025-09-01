part of 'set_request_money_decision_cubit.dart';

sealed class SetRequestMoneyDecisionState extends Equatable {
  const SetRequestMoneyDecisionState();

  @override
  List<Object> get props => [];
}

final class SetRequestMoneyDecisionInitial
    extends SetRequestMoneyDecisionState {}

class LoadingChangeRequestMoneyDecisionState
    extends SetRequestMoneyDecisionState {}

class ChangeRequestMoneyDecisionState extends SetRequestMoneyDecisionState {}
