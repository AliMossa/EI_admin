import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/monies_rates/monies_rates_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/money_text_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MoneyRatesWidget extends StatelessWidget {
  Size size;
  MoniesRatesEntity moniesRatesEntity;
  MoneyRatesWidget({
    required this.moniesRatesEntity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoniesRatesBloc, MoniesRatesState>(
      builder: (context, state) {
        return context
            .read<MoniesRatesBloc>()
            .homeMiddleware
            .getCorrectWidgetForMoniesRates(context, state, size)
            .fold(
              (_) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  gradient: mainGradient3,
                  borderRadius: BorderRadius.circular(15),
                ),

                width: size.width * .3,

                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MoneyTextWidget(
                      titel: 'US Dllar',
                      value: moniesRatesEntity.USD.toString(),
                      size: size,
                    ),
                    MoneyTextWidget(
                      titel: 'Syrian Pound',
                      value: moniesRatesEntity.SYR.toString(),
                      size: size,
                    ),
                    MoneyTextWidget(
                      titel: 'Euro',
                      value: moniesRatesEntity.EUR.toString(),
                      size: size,
                    ),
                    MoneyTextWidget(
                      titel: 'Jp Yen',
                      value: moniesRatesEntity.JPY.toString(),
                      size: size,
                    ),
                  ],
                ),
              ),
              (widget) => widget,
            );
      },
      listener:
          (BuildContext context, MoniesRatesState state) => context
              .read<MoniesRatesBloc>()
              .homeMiddleware
              .showViewEmployeesFailedMessage(context, state),
    );
  }
}
