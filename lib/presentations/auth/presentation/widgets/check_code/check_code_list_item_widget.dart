import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/check_code_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code/check_code_text_field_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_title_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CheckCodeListItemWidget extends StatelessWidget {
  Size size;
  Function() onPress;
  GlobalKey globalKey;
  CheckCodeListItemWidget({
    required this.onPress,
    required this.size,
    required this.globalKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckCodeBloc, CheckCodeState>(
      builder: (context, state) {
        return Form(
          key: globalKey,
          child: ListView(
            children: [
              const SizedBox(height: 50),
              AuthTitleWidget(statement: 'Check confirm code'),

              const SizedBox(height: 50),
              CheckCodeTextFieldWidget(size: size),
              const SizedBox(height: 50),
              state is LoadingVerifyCodeState
                  ? LoadingWidget()
                  : AuthButtonWidget(title: 'check', onPressed: onPress),
            ],
          ),
        );
      },
    );
  }
}
