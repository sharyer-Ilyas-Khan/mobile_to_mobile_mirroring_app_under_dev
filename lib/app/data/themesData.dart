import 'package:mobile_to_mobile_mirroring_app/app/data/text_styles.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: codePinStyle,

  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.circular(8.0),

  ),

);