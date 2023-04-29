import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallGrayText,
          ),
          Text(
            value,
            style: plainText,
          )
        ],
      ),
    );
  }
}
