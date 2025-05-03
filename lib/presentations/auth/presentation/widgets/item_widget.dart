import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code_items_widget.dart'
    show CheckCodeItemsWidget;
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_items_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../util/colors/colors.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: mainGradient),
        child: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 600, minHeight: 500),

            width: moreInfo.width * .6,
            height: moreInfo.height * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white75,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Assets.images.loginImage.image(
                      fit: BoxFit.cover,
                      isAntiAlias: true,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<LoginPagesCubit, LoginPagesState>(
                    builder:
                        (context, state) => Stack(
                          children: [
                            ResetPasswordItems(size: moreInfo),
                            CheckCodeItemsWidget(size: moreInfo),
                            LoginItemsWidget(size: moreInfo),
                          ],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
