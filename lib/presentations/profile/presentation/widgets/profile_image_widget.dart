import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/profile_image_cubit/profile_image_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/arch_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ProfileImageWidget extends StatelessWidget {
  String path;
  Size size;
  ProfileImageWidget({required this.path, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => context.read<ProfileImageCubit>().hover(),
      onExit: (_) => context.read<ProfileImageCubit>().endhover(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: Container(
          width: size.width * .08,
          height: size.width * .08,
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.all(1),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(color: textFieldBorder, width: 2),
            shape: BoxShape.circle,
          ),
          child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
            builder: (context, state) {
              return Stack(
                children: [
                  path.isEmpty &&
                          context
                                  .watch<ProfileBloc>()
                                  .profileMiddleware
                                  .getPersonalImage() ==
                              null
                      ? SvgPicture.asset(
                        Assets.images.user,
                        width: size.width * .08,
                        height: size.width * .08,
                      )
                      : context
                              .watch<ProfileBloc>()
                              .profileMiddleware
                              .getPersonalImage() !=
                          null
                      ? Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.file(
                            context
                                .watch<ProfileBloc>()
                                .profileMiddleware
                                .getPersonalImage()!,
                            fit: BoxFit.cover,
                            width: size.width * .9,
                            height: size.width * .9,
                          ),
                        ),
                      )
                      : Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),

                          child: Image.network(
                            path,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            width: size.width * .9,
                            height: size.width * .9,
                          ),
                        ),
                      ),
                  AnimatedPositioned(
                    top: state is HoverProfileImageState ? 0 : size.height * .1,
                    duration: Duration(milliseconds: 400),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomPaint(
                          size: Size(100, 100),
                          painter: ArchWidget(),
                        ),

                        InkWell(
                          onTap:
                              () => context
                                  .read<ProfileBloc>()
                                  .profileMiddleware
                                  .loadImage(context.read<ProfileBloc>()),
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
