import 'package:flutter/material.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerAppBar(
      {super.key, required this.titleAppBar, required this.iconAppBar});

  final String titleAppBar;
  final IconData iconAppBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          titleAppBar,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(129, 58, 58, 58),
            ),
            child: Icon(
              iconAppBar,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
