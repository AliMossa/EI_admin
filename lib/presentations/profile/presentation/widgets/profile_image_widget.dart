import 'dart:ui';

import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/profile_image_cubit/profile_image_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/arch_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => context.read<ProfileImageCubit>().hover(),
      onExit: (_) => context.read<ProfileImageCubit>().endhover(),
      child: Container(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,

        decoration: BoxDecoration(
          border: Border.all(color: textFieldBorder, width: 2),
          //borderRadius: BorderRadius.circular(50),
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
          builder: (context, state) {
            return Stack(
              children: [
                SvgPicture.asset(Assets.images.user),
                AnimatedPositioned(
                  top: state is HoverProfileImageState ? 0 : 100,
                  duration: Duration(milliseconds: 400),
                  child: Stack(
                    children: [
                      CustomPaint(size: Size(100, 100), painter: ArchWidget()),
                      Positioned(
                        top: 70,
                        left: 35,
                        child: InkWell(
                          onTap:
                              () =>
                                  context
                                      .read<ProfileBloc>()
                                      .profileMiddleware
                                      .loadImage(),
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
