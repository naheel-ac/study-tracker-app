import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final List<Widget> actions;
  final Widget? leading;

  const AppBarWidget({
    super.key,
    required this.text,
    required this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(text), leading: leading, actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
