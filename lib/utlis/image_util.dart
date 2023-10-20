import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

const String svgFormat = "svg";

class ImgUtli {
  static ImageProvider getAssetImage(String name, {String format = 'png'}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(getImgPath(asset));
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 20, targetHeight: 20);
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
