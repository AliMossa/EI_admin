import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/monitoring_history.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_connection_info_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_personal_info_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/view_ids_employee_widget.dart';
import 'package:admin_dashboard/presentations/public/add_new_member/add_new_member.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUpdateEmployeeTotalItems extends StatelessWidget {
  Size size;
  ViewUpdateEmployeeTotalItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewUpdateEmployeeBloc, ViewUpdateEmployeeState>(
      listener:
          (context, state) => context
              .read<ViewUpdateEmployeeBloc>()
              .employeesMiddleware
              .showViewEmployeesFailedMessage(context, state),

      builder:
          (context, state) => context
              .watch<ViewUpdateEmployeeBloc>()
              .employeesMiddleware
              .getCorrectWidgetForUpdateEmployee(state, size)
              .fold(
                (_) => ListView(
                  dragStartBehavior: DragStartBehavior.start,
                  shrinkWrap: true,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ViewEmployeePersonalInfoWidget(
                          id:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .id,
                          isActive:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .isAcitve,

                          name:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .name,
                          fatherName:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .fatherName,
                          motherName:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .motherName,
                          date:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .dateOfBirth,
                          image:
                              context
                                  .watch<ViewUpdateEmployeeBloc>()
                                  .employeesMiddleware
                                  .getViewEmployeeEntity()
                                  .personalPhoto,
                          size: size,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            ViewEmployeeConnectionInfoWidget(
                              email:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .email,
                              phone:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .phone,
                              address:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .address,
                              size: size,
                            ),
                            const SizedBox(height: 10),
                            ViewIdsEmployeeWidget(
                              backIcon: Positioned(
                                top: 0,
                                right: -1,
                                child: IconButton(
                                  onPressed:
                                      () => context
                                          .read<ViewUpdateEmployeeBloc>()
                                          .employeesMiddleware
                                          .updateBackIdImage(
                                            context
                                                .read<ViewUpdateEmployeeBloc>(),
                                          ),
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              frontIcon: Positioned(
                                top: 0,
                                right: -1,
                                child: IconButton(
                                  onPressed:
                                      () => context
                                          .read<ViewUpdateEmployeeBloc>()
                                          .employeesMiddleware
                                          .updateFrontIdImage(
                                            context
                                                .read<ViewUpdateEmployeeBloc>(),
                                          ),
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              showFrontImage:
                                  () => context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .showUpdatedFrontIdImages(context),
                              showBackImage:
                                  () => context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .showupdatedBackIdImages(context),
                              loadedBackFile:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getBackIdImage(),
                              loadedFrontFile:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getFrontIdImage(),
                              showAddedFrontId:
                                  () => context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .showUpdatedViewFrontIdImages(context),
                              showAddedBackId:
                                  () => context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .showUpdatedViewBackIdImages(context),

                              frontIdImage:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .frontIdImage,
                              backIdImage:
                                  context
                                      .watch<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .backIdImage,
                              size: size,
                            ),
                            const SizedBox(height: 10),
                            MonitoringHistory(
                              id:
                                  context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .id,
                              size: size,
                              employeeName:
                                  context
                                      .read<ViewUpdateEmployeeBloc>()
                                      .employeesMiddleware
                                      .getViewEmployeeEntity()
                                      .name!,
                            ),
                          ],
                        ),
                      ],
                    ),
                    state is LoadingUpdateEmployeesState
                        ? LoadingWidget()
                        : AddNewMember(
                          onPress:
                              () => context.read<ViewUpdateEmployeeBloc>().add(
                                UpdateEmployeeEvent(
                                  id:
                                      context
                                          .read<ViewUpdateEmployeeBloc>()
                                          .employeesMiddleware
                                          .getViewEmployeeEntity()
                                          .id,
                                ),
                              ),
                          size: size,
                          title: 'update',
                        ),
                  ],
                ),
                (widget) => widget,
              ),
    );
  }
}
