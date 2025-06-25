import 'package:admin_dashboard/presentations/public/sidebar/logic/cubit/sidebar_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideBarBackButton extends StatelessWidget {
  final function;
  SidebarState state;
  SideBarBackButton({required this.function, required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child:
            state is ShrinkSidebarState
                ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )
                : const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
      ),
    );
  }
}
