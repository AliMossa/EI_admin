part of 'sidebar_cubit.dart';

@immutable
sealed class SidebarState {}

final class SidebarInitial extends SidebarState {}

class ShrinkSidebarState extends SidebarState {}

class ExpandSidebarState extends SidebarState {}

// ignore: must_be_immutable

