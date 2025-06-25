import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/add_admin_question/add_admin_question_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateUserQuestionButtonWidget extends StatelessWidget {
  Size size;
  String title;
  Function() onPress;
  UpdateUserQuestionButtonWidget({
    required this.onPress,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdminQuestionBloc, AddAdminQuestionState>(
      builder: (context, state) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * .14,
            height: 50,
            decoration: BoxDecoration(
              gradient: mainGradient,
              borderRadius: BorderRadius.circular(15),
            ),

            child: ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              ),
              child:
                  state is LoadingAddAdminCommonQuestionState
                      ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                      : Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }
}
