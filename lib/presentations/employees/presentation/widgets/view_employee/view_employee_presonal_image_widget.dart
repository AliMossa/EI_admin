import 'dart:io';

import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/logic/cubit/member_image_cubit.dart';
import 'package:admin_dashboard/presentations/public/arch/arch_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ViewEmployeePresonalImageWidget extends StatelessWidget {
  Size size;
  String? image;
  Function() updateImage;
  ViewEmployeePresonalImageWidget({
    required this.size,
    required this.image,
    required this.updateImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberImageCubit(),
      child: BlocConsumer<MemberImageCubit, MemberImageState>(
        builder: (context, state) {
          return MouseRegion(
            onEnter: (_) => context.read<MemberImageCubit>().hover(),
            onExit: (_) => context.read<MemberImageCubit>().endHover(),
            child: Container(
              padding: EdgeInsets.all(1),
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              width: size.width * .1,
              height: size.width * .1,
              decoration: BoxDecoration(
                border: Border.all(color: textFieldBorder, width: 2),
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  image == null &&
                          context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .image ==
                              null
                      ? SvgPicture.asset(
                        Assets.images.user,
                        width: size.width * .1,
                        height: size.width * .1,
                      )
                      : context
                              .watch<ViewUpdateEmployeeBloc>()
                              .employeesMiddleware
                              .image !=
                          null
                      ? Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),

                          child: Image.file(
                            context
                                .watch<ViewUpdateEmployeeBloc>()
                                .employeesMiddleware
                                .image!,
                            alignment: Alignment.center,
                            height: size.width * .1,
                            width: size.width * .1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      : Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),

                          child: Image.network(
                            alignment: Alignment.center,
                            image!,
                            fit: BoxFit.cover,
                            height: size.width * .1,
                            width: size.width * .1,
                          ),
                        ),
                      ),
                  AnimatedPositioned(
                    top: state is HoverMemberImageState ? 0 : 100,
                    duration: Duration(milliseconds: 400),
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(size.width * .1, size.width * .1),
                          painter: ArchWidget(),
                        ),
                        Positioned(
                          top: 100,
                          left: 50,
                          child: InkWell(
                            onTap: updateImage,
                            child: Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, MemberImageState state) {},
      ),
    );
  }
}
