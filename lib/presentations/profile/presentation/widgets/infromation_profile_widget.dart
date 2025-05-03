import 'package:admin_dashboard/presentations/profile/presentation/widgets/admin_logging_date_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/profile_image_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/profile_title_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/view_profile_fileds_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfromationProfileWidget extends StatelessWidget {
  Size size;
  InfromationProfileWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .3,
      height: size.height * .5,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: textFieldBorder),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfileImageWidget(),
              SizedBox(width: 30),
              ProfileTitleWidget(
                name: 'Ali Mossa',
                joinDate: 'joined in Aprill 2020',
              ),
              SizedBox(width: 50),
              IconButton(
                onPressed:
                    () => context.read<ChangePageBloc>().add(
                      MoveToLoggingProfilePageEvent(title: 'Profile'),
                    ),
                icon: Icon(Icons.access_time_rounded, size: 30, color: black75),
              ),
            ],
          ),
          SizedBox(height: 30),
          ViewProfileFiledsWidget(email: 'email', number: 'number', size: size),
          AdminLoggingDateWidget(
            loggingIn: '9:22 am 2-1-2025',
            loggingOut: '5:22 pm 2-1-2025',
          ),
        ],
      ),
    );
  }
}
