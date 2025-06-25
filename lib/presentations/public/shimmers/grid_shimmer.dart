import 'package:admin_dashboard/presentations/public/shimmers/search_shimmer.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class GridShimmer extends StatelessWidget {
  Size size;

  GridShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: size.height * .74,
        width: size.width * .8,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 8,
          itemBuilder: (context, index) => SearchShimmer(size: size),
        ),
      ),
    );
  }
}
