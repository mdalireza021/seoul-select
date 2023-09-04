import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final String imageLink;

  final double height;
  final double width;
  final double borderRadius;

  const ImageCard({
    Key? key,
    required this.imageLink,
    required this.height,
    required this.width,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      color: Colors.transparent,
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Image.network(
          widget.imageLink,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
