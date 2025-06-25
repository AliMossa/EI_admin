part of 'kinds_cubit.dart';

sealed class KindsState extends Equatable {
  const KindsState();

  @override
  List<Object> get props => [];
}

final class KindsInitial extends KindsState {}

// ignore: must_be_immutable
class ChangeKindsState extends KindsState {}

class LoadingChangeKindsState extends KindsState {}
