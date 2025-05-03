import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/app_bar/widgets/search_field_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget {
  Size size;
  SearchBarWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchFieldWidget(size: size),
        Container(
          width: size.width * .04,
          height: size.width * .04,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: SvgPicture.asset(Assets.images.user, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
