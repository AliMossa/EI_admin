import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/view_id_images_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AddEmployeeIdImageWidget extends StatelessWidget {
  Size size;
  AddEmployeeIdImageWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: linkColor),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('front id image', style: getVariableTitleStyle(size)),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * .175,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyBackground,
                      ),

                      child:
                          context
                                      .watch<AddEmployeeBloc>()
                                      .employeesMiddleware
                                      .getFrontIdImage() ==
                                  null
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap:
                                        () => context
                                            .read<AddEmployeeBloc>()
                                            .employeesMiddleware
                                            .loadFrontIdImage(
                                              context.read<AddEmployeeBloc>(),
                                            ),
                                    child: SvgPicture.asset(
                                      Assets.images.image,
                                      width: size.width * .05,
                                      height: size.width * .05,
                                    ),
                                  ),
                                ],
                              )
                              : SizedBox(
                                width: size.width * .2,
                                height: size.width * .1,
                                child: ViewIdImagesWidget(
                                  size: size,
                                  file:
                                      context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .getFrontIdImage()!,
                                  removeImage:
                                      () => context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .removeFrontIdImage(
                                            context.read<AddEmployeeBloc>(),
                                          ),
                                  showImage:
                                      () => context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .showFrontIdImages(
                                            context,

                                            context.read<AddEmployeeBloc>(),
                                          ),
                                ),
                              ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('back id image', style: getVariableTitleStyle(size)),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * .175,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyBackground,
                      ),

                      child:
                          context
                                      .watch<AddEmployeeBloc>()
                                      .employeesMiddleware
                                      .getBackIdImage() ==
                                  null
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap:
                                        () => context
                                            .read<AddEmployeeBloc>()
                                            .employeesMiddleware
                                            .loadBackIdImage(
                                              context.read<AddEmployeeBloc>(),
                                            ),
                                    child: SvgPicture.asset(
                                      Assets.images.image,
                                      width: size.width * .05,
                                      height: size.width * .05,
                                    ),
                                  ),
                                ],
                              )
                              : SizedBox(
                                width: size.width * .2,
                                height: size.width * .1,
                                child: ViewIdImagesWidget(
                                  size: size,
                                  file:
                                      context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .getBackIdImage()!,
                                  removeImage:
                                      () => context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .removeBackIdImage(
                                            context.read<AddEmployeeBloc>(),
                                          ),
                                  showImage:
                                      () => context
                                          .read<AddEmployeeBloc>()
                                          .employeesMiddleware
                                          .showBackIdImages(
                                            context,

                                            context.read<AddEmployeeBloc>(),
                                          ),
                                ),
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

 // Positioned(
                    //   top: 5,
                    //   right: 5,
                    //   child: IconButton(
                    //     onPressed:
                    //         () => context
                    //             .read<EmployeesBloc>()
                    //             .employeesMiddleware
                    //             .loadFrontIdImage(
                    //               context.read<EmployeesBloc>(),
                    //             ),
                    //     icon: Icon(Icons.add_box_outlined, color: black75),
                    //   ),
                    // ),