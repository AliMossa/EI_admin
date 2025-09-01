import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PropertyItemStatusWidget extends StatelessWidget {
  String isCompleted;
  String completePercent;
  String totalInvestment;
  Size size;
  PropertyItemStatusWidget({
    required this.isCompleted,
    required this.completePercent,
    required this.totalInvestment,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Complete Percent: ', style: getViewedPropertyStyle1(size)),
            Text(completePercent, style: getViewedPropertyStyle2(size)),
          ],
        ),
        const SizedBox(width: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Investments: ', style: getViewedPropertyStyle1(size)),
            Text(totalInvestment, style: getViewedPropertyStyle2(size)),
          ],
        ),
        const SizedBox(width: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Is Completed: ', style: getViewedPropertyStyle1(size)),
            Text(isCompleted, style: getViewedPropertyStyle2(size)),
          ],
        ),
      ],
    );
  }
}
/*
 if (propertyListEntity
                                        .list[index]
                                        .progressPercent!
                                        .isNotEmpty)
                                      Row(
                                        children: [
                                          Text('complete percent'),
                                          Text(
                                            propertyListEntity
                                                .list[index]
                                                .progressPercent!,
                                          ),
                                        ],
                                      ),
                                    if (propertyListEntity
                                        .list[index]
                                        .isCompleted!
                                        .isNotEmpty)
                                      Text(
                                        propertyListEntity
                                            .list[index]
                                            .isCompleted!,
                                      ),
*/