import 'dart:io';
import 'package:flutter/material.dart';

Widget productImage(String? path,
    {double size = 50, BoxFit fit = BoxFit.cover}) {
  if (path == null || path.isEmpty) {
    return const Icon(Icons.image_not_supported);
  }

  if (path.startsWith('assets/')) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: fit,
    );
  } else {
    return Image.file(
      File(path),
      width: size,
      height: size,
      fit: fit,
    );
  }
}
