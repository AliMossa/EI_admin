import 'package:admin_dashboard/presentations/public/public_widgets/property_study_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_variables_widget.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class EconomyStudyWidget extends StatelessWidget {
  Size size;
  int numberOfChances;
  int profitPercent;
  double expectedPrice;
  double totalExpectedTaxes;
  double buyingPrice;
  double? rentingPrice;
  double chancePrice;
  String investmentTime;
  String incommingTime;
  String investmentMode;
  String propertyManagement;
  String? agreedNegotiation;
  EconomyStudyWidget({
    required this.numberOfChances,
    required this.profitPercent,
    required this.expectedPrice,
    required this.totalExpectedTaxes,
    required this.buyingPrice,
    required this.rentingPrice,
    required this.chancePrice,
    required this.investmentTime,
    required this.incommingTime,
    required this.investmentMode,
    required this.propertyManagement,
    required this.agreedNegotiation,

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
              value: expectedPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'investment time',
              value: investmentTime,
              width: 350,
              textWidth: 100,
              height: 25,
              isMovible: true,
              symbol: 'days',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'investment mode:',
              value: investmentMode,
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
              value: buyingPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),

            PropertyVariablesWidget(
              title: 'chances number:',
              value: numberOfChances.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'incomming time:',
              value: incommingTime,
              width: 300,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),
            if (rentingPrice != null)
              PropertyVariablesWidget(
                title: 'property management:',
                value: propertyManagement.toString(),
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
              value: chancePrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              symbol: '\$',
              size: size,

              isMovible: true,
            ),
            PropertyVariablesWidget(
              title: 'expected price:',
              value: expectedPrice.toString(),
              width: 300,
              textWidth: 90,
              height: 25,
              isMovible: true,
              symbol: '\$',
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'profil precentage:',
              value: profitPercent.toString(),
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
