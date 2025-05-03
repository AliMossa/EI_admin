import 'package:admin_dashboard/presentations/profile/presentation/widgets/logging_page_item_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewLoggingPageWidget extends StatelessWidget {
  Size size;
  ViewLoggingPageWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed:
              () => context.read<ChangePageBloc>().add(
                MoveToProfilePageEvent(title: 'Profile'),
              ),
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        SizedBox(
          height: size.height * .77,
          width: size.width * .8,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder:
                (context, index) => LoggingPageItemWidget(
                  title: 'title',
                  time: '12:20 am 1-2-2025',
                ),
          ),
        ),
      ],
    );
  }
}
