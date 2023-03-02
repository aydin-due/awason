import 'package:flutter/material.dart';

const blue = Color(0xFF160084);

const heading = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w700,
  color: blue,
);

const subtitle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w400,
);

const inputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: blue, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);