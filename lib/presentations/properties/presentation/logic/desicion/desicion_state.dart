part of 'desicion_cubit.dart';

sealed class DesicionState extends Equatable {
  const DesicionState();

  @override
  List<Object> get props => [];
}

final class DesicionInitial extends DesicionState {}

class LoadingSetDesicionState extends DesicionState {}

class SetDesicionState extends DesicionState {}
