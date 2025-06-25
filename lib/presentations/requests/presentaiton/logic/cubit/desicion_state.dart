part of 'desicion_cubit.dart';

sealed class DesicionState extends Equatable {
  const DesicionState();

  @override
  List<Object> get props => [];
}

final class DesicionInitial extends DesicionState {}

// ignore: must_be_immutable
class ChangeDesicionState extends DesicionState {
  int desicionValue;
  ChangeDesicionState({required this.desicionValue});
}

class LoadingChangeDesicionState extends DesicionState {}
