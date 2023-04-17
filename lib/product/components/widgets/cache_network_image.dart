import 'package:flutter/material.dart';

class NetworkImageView extends StatefulWidget {
  const NetworkImageView({
    super.key,
    required this.image,
    this.radius,
  });
  final double? radius;
  final String image;
  @override
  State<NetworkImageView> createState() => _NetworkImageViewState();
}

class _NetworkImageViewState extends State<NetworkImageView> {
  bool pageUpdated = false;
  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: 32,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(widget.image),
      );
}
