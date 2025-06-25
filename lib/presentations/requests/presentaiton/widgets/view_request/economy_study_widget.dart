import 'package:admin_dashboard/presentations/public/public_widgets/property_study_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_variables_widget.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class EconomyStudyWidget extends StatelessWidget {
  Size size;
  RequestEconomicInfoEntity requestEconomicInfoEntity;
  EconomyStudyWidget({
    required this.requestEconomicInfoEntity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PropertyStudyWidget(
          title: 'Economic study',
          height: size.height * .32,
          width: size.width * .8,
          firstItemsWidget: [
            PropertyVariablesWidget(
              title: 'negotiation mode:',
              value: 'negotiate',
              width: 300,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),

            PropertyVariablesWidget(
              title: 'total expected taxes',
              value: requestEconomicInfoEntity.expectedPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'investment time',
              value: requestEconomicInfoEntity.investmentTime,
              width: 350,
              textWidth: 100,
              height: 25,
              isMovible: true,
              symbol: 'days',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'investment mode:',
              value: requestEconomicInfoEntity.investmentMode,
              width: 300,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),
          ],
          secondItemsWidget: [
            PropertyVariablesWidget(
              title: 'buying price:',
              value: requestEconomicInfoEntity.buyingPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),

            PropertyVariablesWidget(
              title: 'chances number:',
              value: requestEconomicInfoEntity.numberOfChances.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'incomming time:',
              value: requestEconomicInfoEntity.incommingTime,
              width: 300,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),
            if (requestEconomicInfoEntity.rentingPrice != null)
              PropertyVariablesWidget(
                title: 'property management:',
                value: requestEconomicInfoEntity.propertyManagement.toString(),
                width: 300,
                textWidth: 70,
                height: 25,
                isMovible: true,
                size: size,
              ),
          ],
          thirdItemsWidget: [
            PropertyVariablesWidget(
              title: 'chance price:',
              value: requestEconomicInfoEntity.chancePrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              symbol: '\$',
              size: size,

              isMovible: true,
            ),
            PropertyVariablesWidget(
              title: 'expected price:',
              value: requestEconomicInfoEntity.expectedPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'profil precentage:',
              value: requestEconomicInfoEntity.profitPercent.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '%',
              size: size,
            ),
          ],
        ),
      ],
    );
  }
}
