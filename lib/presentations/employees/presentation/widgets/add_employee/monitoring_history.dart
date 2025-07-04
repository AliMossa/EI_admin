import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MonitoringHistory extends StatelessWidget {
  Size size;
  int id;
  String employeeName;
  MonitoringHistory({
    required this.id,
    required this.size,
    required this.employeeName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .41,

      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('monitoring history', style: getVariableTitleStyle(size)),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed:
                () => context.read<ChangePageBloc>().add(
                  MoveToHistoryPageEvent(
                    id: id,
                    backWordFunction: MoveToViewEmployeePageEvent(
                      id: id,
                      title: 'Employee',
                    ),
                    title: employeeName,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
