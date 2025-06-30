import 'package:admin_dashboard/presentations/home/presentation/logic/cubit/statistics_date_cubit.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_date_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SetDateWidget extends StatelessWidget {
  Size size;
  SetDateWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatisticsDateCubit, StatisticsDateState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AddDateWidget(
            title: '',
            birth: context.read<StatisticsDateCubit>().homeMiddleware.getTime(),
            onPress:
                () => context
                    .read<StatisticsDateCubit>()
                    .homeMiddleware
                    .setDate(context, context.read<StatisticsDateCubit>()),
            size: size,
          ),
        );
      },
      listener:
          (BuildContext context, StatisticsDateState state) => context
              .read<StatisticsDateCubit>()
              .homeMiddleware
              .sendManyRequests(context, state),
    );
  }
}
