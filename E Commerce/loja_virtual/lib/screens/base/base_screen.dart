import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LoginScreen(),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home1'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home2'),
            ),
          ),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home3'),
            ),
          ),
        ],
      ),
    );
  }
}
