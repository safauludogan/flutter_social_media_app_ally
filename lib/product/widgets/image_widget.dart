import 'package:flutter/material.dart';

enum ImageConstants {
  splash;

  Image get toWidget => Image.asset('assets/images/img_$name.png');
}
