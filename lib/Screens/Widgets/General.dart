import 'package:flutter/material.dart';
import 'package:google_maps/Repository/API.dart';

Widget buildHeightSpacer(double myHeight) => SizedBox(
      height: myHeight,
    );

Widget buildTextData(String myText) => Text(
      "$myText",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.00,
        fontWeight: FontWeight.w500,
      ),
    );
