import 'package:flutter/material.dart';

// colors
const blue = Color(0xFF160084);
const gray = Color(0xFFE5E5E5);
const darkGray = Color(0xFF595959);
const yellow = Color(0xFFFFC107);
const lightGray = Color(0xFFF5F5F5);
const green = Color(0xFF4CAF50);
const red = Color(0xFFE53935);

// text styles
const heading = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w700,
  color: blue,
);

const lightHeading = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const sliderTitle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const subtitle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w400,
);

const blueButtonText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const boldDateText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const blueLink = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: blue,
);

const plainText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const boldText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

const grayText = TextStyle(
  fontSize: 16, 
  fontWeight: FontWeight.w400, 
  color: darkGray
);

const appbarTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

const listTileTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

const cardText = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

// input decoration
const inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: gray, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: blue, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

// buttons
final blueBlockButton = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 50),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final blueButton = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final cardDecor = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: BorderSide(
    color: Colors.grey.withOpacity(0.2),
    width: 1,
  ),
);