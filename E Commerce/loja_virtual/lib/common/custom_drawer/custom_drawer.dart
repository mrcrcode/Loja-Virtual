import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerTile(
            iconData: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTile(iconData: Icons.list, title: 'Produtos', page: 1),
          DrawerTile(
              iconData: Icons.local_grocery_store_outlined,
              title: 'Meus Pedidos',
              page: 2),
          DrawerTile(iconData: Icons.location_on, title: 'Loja', page: 3),
        ],
      ),
    );
  }
}
