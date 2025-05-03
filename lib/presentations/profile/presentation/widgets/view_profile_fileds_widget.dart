import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/change_email_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/change_number_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/update_profile_filed_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/view_profile_fields_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProfileFiledsWidget extends StatelessWidget {
  String email;
  String number;
  Size size;
  ViewProfileFiledsWidget({
    required this.email,
    required this.number,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SizedBox(
          height: size.height * .2,

          child: ListView(
            children: [
              BlocBuilder<ChangeEmailCubit, ChangeEmailState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: state is UpdateEmailFieldProfileState ? 0 : 1,
                        child:
                            state is UpdateEmailFieldProfileState
                                ? SizedBox()
                                : ViewProfileFieldsItemWidget(
                                  content: email,
                                  leading: Icon(Icons.email),
                                  trailing: Icon(Icons.edit),
                                  onPress: () {
                                    context
                                        .read<ChangeEmailCubit>()
                                        .updateEmail();
                                  },
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 400),
                          opacity:
                              state is UpdateEmailFieldProfileState ? 1 : 0,
                          child:
                              state is UpdateEmailFieldProfileState
                                  ? UpdateProfileFiledWidget(
                                    content: email,
                                    leading: Icon(Icons.email),
                                    trailing: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    size: size,
                                    onPress:
                                        () =>
                                            context
                                                .read<ChangeEmailCubit>()
                                                .saveEmail(),
                                  )
                                  : SizedBox(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              BlocBuilder<ChangeNumberCubit, ChangeNumberState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: state is UpdateNumberFieldProfileState ? 0 : 1,
                        child:
                            state is UpdateNumberFieldProfileState
                                ? SizedBox()
                                : ViewProfileFieldsItemWidget(
                                  content: number,
                                  leading: Icon(Icons.phone),
                                  trailing: Icon(Icons.edit),
                                  onPress:
                                      () =>
                                          context
                                              .read<ChangeNumberCubit>()
                                              .updateNumber(),
                                ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 400),
                          opacity:
                              state is UpdateNumberFieldProfileState ? 1 : 0,
                          child:
                              state is UpdateNumberFieldProfileState
                                  ? UpdateProfileFiledWidget(
                                    content: email,
                                    leading: Icon(Icons.phone),
                                    trailing: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    size: size,
                                    onPress:
                                        () =>
                                            context
                                                .read<ChangeNumberCubit>()
                                                .saveNumber(),
                                  )
                                  : SizedBox(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
