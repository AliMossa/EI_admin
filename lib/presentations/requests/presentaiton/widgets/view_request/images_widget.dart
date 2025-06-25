import 'package:admin_dashboard/presentations/public/public_widgets/property_study_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/requests_images_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagesWidget extends StatelessWidget {
  Size size;
  List<String> images;
  List<String> documents;
  List<String> ids;
  Function(BuildContext, List<String>) onPress;
  ImagesWidget({
    required this.images,
    required this.documents,
    required this.ids,
    required this.onPress,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PropertyStudyWidget(
          title: 'Property images',
          height: size.height * .28,
          width: size.width * .27,
          firstItemsWidget: [
            InkWell(
              onTap: () => onPress(context, images),
              child: RequestsImagesWidget(size: size, images: images),
            ),
          ],
        ),
        const SizedBox(width: 10),
        PropertyStudyWidget(
          title: 'Property document',
          height: size.height * .28,
          width: size.width * .27,
          firstItemsWidget: [
            InkWell(
              onTap: () => onPress(context, documents),
              child: RequestsImagesWidget(size: size, images: documents),
            ),
          ],
        ),
        const SizedBox(width: 10),
        PropertyStudyWidget(
          title: 'Id images',
          height: size.height * .28,
          width: size.width * .27,
          firstItemsWidget: [
            InkWell(
              onTap: () => onPress(context, ids),
              child: RequestsImagesWidget(size: size, images: ids),
            ),
          ],
        ),
      ],
    );
  }
}
