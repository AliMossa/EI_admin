import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/employee_enitity.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/models/employee_model.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_kinds_menus_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_member_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/status_item_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class EmployeesMembersWidget extends StatefulWidget {
  List<EmployeeEnitity> list;
  EmployeesMembersWidget({required this.list, super.key});

  @override
  State<EmployeesMembersWidget> createState() => _EmployeesMembersWidgetState();
}

class _EmployeesMembersWidgetState extends State<EmployeesMembersWidget> {
  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<EmployeesBloc, EmployeesState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ViewKindsMenusWidget(
                  size: moreInfo,
                  activeList: EmployeeModel().getEmployeesStatus(),
                  teamKindList: EmployeeModel().getEmployeesTeams(),
                ),
                SizedBox(
                  height: moreInfo.height * .76,
                  width: moreInfo.width * .8,

                  child: context
                      .read<EmployeesBloc>()
                      .employeesMiddleware
                      .getCorrectWidget(state, moreInfo)
                      .fold(
                        (_) => NotificationListener(
                          onNotification: (ScrollNotification notification) {
                            if (notification.metrics.pixels ==
                                notification.metrics.maxScrollExtent) {}
                            return false;
                          },
                          child: AnimatedList(
                            key:
                                context
                                    .watch<EmployeesBloc>()
                                    .employeesMiddleware
                                    .getAnimatedListGlobalKey(),
                            initialItemCount:
                                context
                                    .watch<EmployeesBloc>()
                                    .employeesMiddleware
                                    .getTotalEmployeesEntity()
                                    .employees
                                    .length,
                            shrinkWrap: true,
                            itemBuilder:
                                (context, index, animation) => FadeTransition(
                                  opacity: animation.drive(
                                    Tween<double>(begin: 0, end: 1),
                                  ),
                                  child: ItemListWidget(
                                    name: widget.list[index].name,
                                    size: moreInfo,
                                    status: [
                                      StatusItemWidget(
                                        date: widget.list[index].joinedDate,
                                        size: moreInfo,
                                        status: 'logged in ',
                                      ),
                                    ],
                                    date: '10-12-2025',
                                    onPressed:
                                        () =>
                                            context.read<ChangePageBloc>().add(
                                              MoveToViewEmployeePageEvent(
                                                id: widget.list[index].id,
                                                title: 'Employee',
                                              ),
                                            ),
                                  ),
                                ),
                          ),
                        ),
                        (widget) => widget,
                      ),
                ),
              ],
            ),
            AddMemberButtonWidget(
              onPress:
                  () => context.read<ChangePageBloc>().add(
                    MoveToAddEmployeesPageEvent(title: 'Employee'),
                  ),
            ),
          ],
        );
      },
    );
  }
}
