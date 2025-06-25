import 'package:admin_dashboard/presentations/home/presentation/widgets/liner_chart_widget.dart';
import 'package:flutter/widgets.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return SizedBox(
      width: moreInfo.width * .8,
      height: moreInfo.height * .8,
      child: ListView(
        children: [
          LinerChartWidget(
            data: [],
            maxValue: 100,
            minValue: 0,
            size: moreInfo,
          ),
        ],
      ),
    );
  }
}
