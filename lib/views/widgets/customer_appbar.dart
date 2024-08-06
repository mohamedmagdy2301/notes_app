import 'package:flutter/material.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerAppBar(
      {super.key,
      required this.titleAppBar,
      required this.iconAppBar,
      required this.onTap});

  final String titleAppBar;
  final IconData iconAppBar;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          titleAppBar,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(129, 58, 58, 58),
              ),
              child: Icon(
                iconAppBar,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
