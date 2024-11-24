import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
