import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/employee_image_cubit.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../profile/presentation/widgets/arch_widget.dart';

class AddEmployeeImageWidget extends StatelessWidget {
  Size size;
  AddEmployeeImageWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => context.read<EmployeeImageCubit>().hover(),
      onExit: (_) => context.read<EmployeeImageCubit>().endHover(),
      child: Container(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        width: size.width * .1,
        height: size.width * .1,
        decoration: BoxDecoration(
          border: Border.all(color: textFieldBorder, width: 2),
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<EmployeeImageCubit, EmployeeImageState>(
          builder: (context, state) {
            return Stack(
              children: [
                SvgPicture.asset(
                  Assets.images.user,
                  width: size.width * .1,
                  height: size.width * .1,
                ),
                AnimatedPositioned(
                  top: state is HoverEmployeeImageState ? 0 : 100,
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
                          onTap:
                              () =>
                                  context
                                      .read<EmployeeImageCubit>()
                                      .employeesMiddleware
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
