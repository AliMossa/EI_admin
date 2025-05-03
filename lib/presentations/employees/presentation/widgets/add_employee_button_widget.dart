import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeButtonWidget extends StatelessWidget {
  const AddEmployeeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 30,
      child: Container(
        decoration: BoxDecoration(
          gradient: mainGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed:
              () => context.read<ChangePageBloc>().add(
                MoveToAddEmployeesPageEvent(title: 'Add Employee'),
              ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
