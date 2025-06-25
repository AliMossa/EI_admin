import 'package:admin_dashboard/presentations/public/shimmers/search_shimmer.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ListSearchShimmer extends StatelessWidget {
  Size size;

  ListSearchShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SizedBox(
        height: size.height * .74,
        width: size.width * .8,
        child: ListView(
          children: [
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
            SearchShimmer(size: size),
          ],
        ),
      ),
    );
  }
}
