import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget build(BuildContext context) {
    // final _store = Provider.of<GlobalStore>(context, listen: false);
    return AppBar(
      title: const Text("PokeDex"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

Widget imageWidget(int index, _pokeConstant, double width, double height) {
  return Hero(
    tag: index,
    child: Image.network(
      _pokeConstant.getImage(index + 1),
      fit: BoxFit.cover,
      height: height,
      width: width,
    ),
  );
}
