import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
