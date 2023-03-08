import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({
    Key? key, this.title = Texts.awason,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: appbarTitle,
      ),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset('assets/blue_icon.png', width: 40, height: 40),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
