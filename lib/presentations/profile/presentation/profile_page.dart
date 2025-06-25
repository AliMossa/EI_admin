import 'package:admin_dashboard/presentations/profile/data/repositories_sources/profile_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/change_email_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/change_number_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/cubit/profile_image_cubit/profile_image_cubit.dart';
import 'package:admin_dashboard/presentations/profile/presentation/middleware/profile_middleware.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/profile_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create:
              (context) => ProfileBloc(
                updateProfileUseCase: UpdateProfileUseCase(
                  profileRespository: ProfileRepositoryImpSource(),
                ),
                profileMiddleware: ProfileMiddleware().get(),
                getProfileUseCase: GetProfileUseCase(
                  profileRespository: ProfileRepositoryImpSource(),
                ),
              )..add(GetProfileInfoEvent()),
        ),
        BlocProvider<ChangeEmailCubit>(create: (context) => ChangeEmailCubit()),
        BlocProvider<ChangeNumberCubit>(
          create: (context) => ChangeNumberCubit(),
        ),
        BlocProvider<ProfileImageCubit>(
          create: (context) => ProfileImageCubit(),
        ),
      ],
      child: ProfileItems(size: moreInfo),
    );
  }
}
