import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/log_page_icon_button_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/profile_image_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/profile_title_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/view_profile_fileds_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class InfromationProfileWidget extends StatelessWidget {
  Size size;
  ProfileEntity profileEntity;
  InfromationProfileWidget({
    required this.size,
    required this.profileEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return context
            .read<ProfileBloc>()
            .profileMiddleware
            .checkCurrentState(state, size)
            .fold(
              (_) => Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,

                width: FlexibleMethod.getCorrectProfileWidth(size).width,
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(color: textFieldBorder),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfileImageWidget(
                          path: profileEntity.pesonalPhoto,
                          size: size,
                        ),
                        SizedBox(width: size.width * .01),
                        ProfileTitleWidget(
                          size: size,
                          name: profileEntity.name,
                          joinDate: profileEntity.joindedDate,
                        ),
                        SizedBox(width: size.width * .01),

                        LogPageIconButtonWidget(id: profileEntity.id),
                      ],
                    ),
                    SizedBox(width: size.width * .01),

                    ViewProfileFiledsWidget(
                      email: profileEntity.email,
                      number: profileEntity.phone,
                      size: size,
                    ),
                    // AdminLoggingDateWidget(
                    //   size: size,
                    //   loggingIn: '9:22 am 2-1-2025',
                    //   loggingOut: '5:22 pm 2-1-2025',
                    // ),
                  ],
                ),
              ),
              (widget) => widget,
            );
      },
    );
  }
}
