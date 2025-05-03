part of 'change_selected_color_cubit.dart';

@immutable
sealed class ChangeSelectedColorState {}

final class ChangeSelectedColorInitial extends ChangeSelectedColorState {}

class ChangeColorSelectedItemState extends ChangeSelectedColorState {
  int index;
  ChangeColorSelectedItemState({required this.index});
}
