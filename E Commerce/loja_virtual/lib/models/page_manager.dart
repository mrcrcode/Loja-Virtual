import 'package:flutter/cupertino.dart';

class PageManager {
  PageManager(this.pageController);

  final PageController pageController;

  int page = 0;

  void setPage(int value) {
    if (value == page) return;
    page = value;
    pageController.jumpToPage(value);
  }
}
