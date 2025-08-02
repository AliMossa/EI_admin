import 'package:admin_dashboard/presentations/auth/data/repositories_sources/auth_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/logout_use_case.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/logic/bloc/logout_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/logic/change_selected_color_item/cubit/change_selected_color_cubit.dart';
import 'package:admin_dashboard/presentations/public/sidebar/logic/cubit/sidebar_cubit.dart';
import 'package:admin_dashboard/presentations/public/sidebar/middleware/sidebar_middleware.dart';
import 'package:admin_dashboard/presentations/public/sidebar/widgets/side_bar_divider_widget.dart';
import 'package:admin_dashboard/presentations/public/sidebar/widgets/sidebar_item.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/side_bar_back_button.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return FittedBox(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SidebarCubit>(create: (context) => SidebarCubit()),
          BlocProvider(
            create:
                (context) => ChangeSelectedColorCubit(
                  sidebarMiddleware: SidebarMiddleware(),
                )..ChangeColorSelectedItem(0),
          ),
          BlocProvider<LogoutBloc>(
            create:
                (context) => LogoutBloc(
                  logoutUsecase: LogoutUseCase(
                    authRepository: AuthRempositoryImpSource(),
                  ),
                  sidebarMiddleware: SidebarMiddleware().get(),
                ),
          ),
        ],
        child: BlocBuilder<SidebarCubit, SidebarState>(
          builder: (context, state) {
            return AnimatedContainer(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              clipBehavior: Clip.hardEdge,
              constraints: const BoxConstraints(minWidth: 75),
              curve: Curves.easeIn,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                gradient: mainGradient,
                borderRadius: BorderRadius.circular(25),
              ),
              height: moreInfo.height,
              width:
                  state is ShrinkSidebarState
                      ? moreInfo.width * .04
                      : SidebarMiddleware().getCorrectWidth(
                        moreInfo.width,
                        moreInfo.height,
                      ),
              child: BlocBuilder<
                ChangeSelectedColorCubit,
                ChangeSelectedColorState
              >(
                builder: (context, state) {
                  return ListView(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: moreInfo.height * .15,
                        child: Assets.logo.logo.image(),
                      ),
                      const SizedBox(height: 10),
                      SidebarItem(
                        index: 0,
                        icon: Icons.home,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(0);
                          context.read<ChangePageBloc>().add(
                            MoveToHomePageEvent(title: 'Home'),
                          );
                        },
                        title: 'Home',
                      ),
                      SidebarItem(
                        index: 1,
                        icon: Icons.person_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(1);
                          context.read<ChangePageBloc>().add(
                            MoveToProfilePageEvent(title: 'Profile'),
                          );
                        },
                        title: 'Profile',
                      ),
                      SidebarItem(
                        index: 2,
                        icon: Icons.cases_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(2);
                          context.read<ChangePageBloc>().add(
                            MoveToEmployeesPageEvent(title: 'Emplyees'),
                          );
                        },
                        title: 'Employees',
                      ),
                      SidebarItem(
                        index: 3,
                        icon: Icons.people_alt_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(3);
                          context.read<ChangePageBloc>().add(
                            MoveToUsersPageEvent(title: 'Users'),
                          );
                        },
                        title: 'Users',
                      ),
                      SidebarItem(
                        index: 4,
                        icon: Icons.description_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(4);
                          context.read<ChangePageBloc>().add(
                            MoveToRequestsPageEvent(title: 'Requests'),
                          );
                        },
                        title: 'Requests',
                      ),
                      SidebarItem(
                        index: 5,
                        icon: Icons.redeem_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(5);
                          context.read<ChangePageBloc>().add(
                            MoveToRewardsPageEvent(title: 'Rewards'),
                          );
                        },
                        title: 'Rewards',
                      ),
                      SidebarItem(
                        index: 6,
                        icon: Icons.home_work_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(6);
                          context.read<ChangePageBloc>().add(
                            MoveToPropertiesPageEvent(title: 'Properties'),
                          );
                        },
                        title: 'Properties',
                      ),
                      SidebarItem(
                        index: 7,
                        icon: Icons.wallet,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(7);
                          context.read<ChangePageBloc>().add(
                            MoveToWalletPageEvent(title: 'Wallet'),
                          );
                        },
                        title: 'Wallet',
                      ),
                      SidebarItem(
                        index: 8,
                        icon: Icons.help_rounded,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(8);
                          context.read<ChangePageBloc>().add(
                            MoveToQuestionsPageEvent(title: 'Questions'),
                          );
                        },
                        title: 'Questions',
                      ),

                      SideBarDividerWidget(color: Colors.white, thickness: 3),
                      SidebarItem(
                        index: 9,
                        icon: Icons.settings,
                        onClicked: () {
                          context
                              .read<ChangeSelectedColorCubit>()
                              .ChangeColorSelectedItem(8);
                          context.read<ChangePageBloc>().add(
                            MoveToSettingsPageEvent(title: 'Settings'),
                          );
                        },
                        title: 'Settings',
                      ),
                      BlocConsumer<LogoutBloc, LogoutState>(
                        builder: (context, state) {
                          return SidebarItem(
                            index: 10,
                            icon: Icons.logout,
                            onClicked:
                                () => context
                                    .read<LogoutBloc>()
                                    .sidebarMiddleware
                                    .showNotice(
                                      context,
                                      moreInfo,
                                      context.read<LogoutBloc>(),
                                      'Logging out',
                                      'are you sure?',
                                    ),
                            title: 'Logout',
                          );
                        },
                        listener: (BuildContext context, LogoutState state) {
                          if (state is SuccessSendLogoutState) {
                            context.push('/');
                          } else {
                            context.pop();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SideBarBackButton(
                            function:
                                () =>
                                    context
                                        .read<SidebarCubit>()
                                        .changeSideBarWidth(),
                            state: context.read<SidebarCubit>().state,
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

/*

*/
