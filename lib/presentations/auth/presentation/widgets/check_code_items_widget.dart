import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/back_check_code_arrow.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code_button_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code_text_field_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CheckCodeItemsWidget extends StatelessWidget {
  Size size;
  CheckCodeItemsWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPagesCubit, LoginPagesState>(
      builder: (context, state) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 400),
          opacity: state is MoveToCheckCodePageState ? 1 : 0,

          child:
              context.read<LoginPagesCubit>().state is MoveToCheckCodePageState
                  ? Column(
                    children: [
                      const SizedBox(height: 50),
                      CheckCodeTitleWidget(),
                      const SizedBox(height: 50),
                      CheckCodeTextFieldWidget(size: size),
                      const SizedBox(height: 50),
                      CheckCodeButtonWidget(size: size),
                      BackCheckCodeArrow(),
                    ],
                  )
                  : SizedBox(),
        );
      },
    );
  }
}
