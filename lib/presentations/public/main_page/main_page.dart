import 'package:admin_dashboard/presentations/employees/presentation/employees_page.dart';
import 'package:admin_dashboard/presentations/profile/presentation/profile_page.dart';
import 'package:admin_dashboard/presentations/public/app_bar/app_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocProvider<ChangePageBloc>(
        create:
            (context) =>
                ChangePageBloc()..add(MoveToHomePageEvent(title: 'Home')),
        child: BlocConsumer<ChangePageBloc, ChangePageState>(
          listener: (context, state) {
            context.read<ChangePageBloc>().mainPageMiddleware.changeTitle(
              state,
            );
          },
          builder: (context, state) {
            return Row(
              children: [
                Sidebar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarWidget(
                      title:
                          context
                              .read<ChangePageBloc>()
                              .mainPageMiddleware
                              .title,
                      size: moreInfo,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [EmployeesPage(), ProfilePage()],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
