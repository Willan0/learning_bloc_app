import 'package:flutter/cupertino.dart';
import 'package:learning_bloc_app/common/values/images.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
      required this.image,
      this.isNetwork = false,
      this.width = 200,
        this.radius = 0,
      this.height = 200});

  final String image;
  final bool isNetwork;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: isNetwork
            ? FadeInImage(
                width: width,
                height: height,
                imageErrorBuilder: (context, error, stackTrace) =>
                    const Icon(CupertinoIcons.nosign),
                placeholder: const AssetImage(kIcLauncherImg),
                image: NetworkImage(
                  image,
                ))
            : Image.asset(
                image,
                width: width,
                height: height,
              ),
      ),
    );
  }
}
