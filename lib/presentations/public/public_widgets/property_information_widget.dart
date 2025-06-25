import 'package:admin_dashboard/presentations/public/public_widgets/property_study_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_type_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_variables_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/sold_tag_widget.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PropertyInformationWidget extends StatelessWidget {
  String balconySize;
  String propertyAge;
  String bathroomNumbers;
  String overlook;
  String areaSize;
  String roomNumbers;
  String flooringType;
  String decoration;
  String kitchenType;
  String paintingType;
  String price;
  String payWay;
  String propertyType;
  String contract;
  String state;
  String exactPosition;
  Size size;
  PropertyInformationWidget({
    required this.propertyType,
    required this.areaSize,
    required this.balconySize,
    required this.roomNumbers,
    required this.bathroomNumbers,
    required this.overlook,
    required this.propertyAge,
    required this.decoration,
    required this.flooringType,
    required this.kitchenType,
    required this.paintingType,
    required this.price,
    required this.payWay,
    required this.contract,
    required this.state,
    required this.exactPosition,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .7,
      height: size.width * .2,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PropertyStudyWidget(
            width: size.width * .35,
            title: 'Property description',
            height: size.height * .36,
            firstItemsWidget: [
              PropertyVariablesWidget(
                title: 'space',
                value: areaSize,
                width: 220,
                height: 25,
                symbol: 'm\u00b2',
                isMovible: true,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'number of bathroom',
                value: bathroomNumbers,
                width: 225,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'overlook from 10',
                value: overlook,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'property age',
                value: propertyAge,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'balcony size',
                value: balconySize,
                symbol: 'm\u00b2',
                width: 250,
                height: 25,
                isMovible: true,
                size: size,
              ),
            ],
            secondItemsWidget: [
              PropertyVariablesWidget(
                title: 'number of rooms',
                value: roomNumbers,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'flooring type',
                value: flooringType,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'decoration',
                value: decoration,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'kitchen type',
                value: kitchenType,
                width: 220,
                height: 25,
                size: size,
              ),
              PropertyVariablesWidget(
                title: 'painting type',
                value: paintingType,
                width: 220,
                height: 25,
                size: size,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PropertyStudyWidget(
                    title: 'Financial information',
                    height: size.height * .18,
                    width: size.width * .23,
                    firstItemsWidget: [
                      PropertyVariablesWidget(
                        title: 'expected price',
                        value: price,
                        symbol: '\$',
                        width: 300,
                        height: 25,
                        isMovible: true,
                        size: size,
                      ),
                      PropertyVariablesWidget(
                        title: 'payment way',
                        value: payWay,
                        width: 220,
                        height: 24,
                        size: size,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  PropertyStudyWidget(
                    title: 'property & contract',
                    height: size.height * .18,
                    width: size.width * .23,
                    firstItemsWidget: [
                      PropertyTypeWidget(title: propertyType, size: size),
                      PropertyVariablesWidget(
                        title: 'contract',
                        value: contract,
                        width: 220,
                        height: 25,
                        size: size,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              PropertyStudyWidget(
                title: 'Location information',
                height: size.height * .18,
                width: size.width * .46,
                firstItemsWidget: [
                  PropertyVariablesWidget(
                    title: 'state',
                    value: state,
                    width: 220,
                    height: 25,
                    size: size,
                  ),
                  PropertyVariablesWidget(
                    title: 'exact position',
                    value: exactPosition,
                    width: 600,
                    height: 24,
                    isMovible: true,
                    size: size,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
