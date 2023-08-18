import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  // CircleImage has two parameters: imageProvider and imageRadius.
  const CircleImage({
    super.key,
    this.imageProvider,
    this.imageRadius = 20,
  });

  // The imageRadius and imageProvider property declarations.
  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    // CircleAvatar is a widget provided by the Material library. It’s defined
    // as a white circle with a radius of imageRadius.
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // Within the outer circle is another CircleAvatar, which is a smaller
      // circle that includes the user’s profile image. Making the inner circle
      // smaller gives you the white border effect.
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
