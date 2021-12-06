import 'package:flutter/material.dart';

enum TabItem { meals, account }

class TabItemData {
  const TabItemData({Key? key, required this.title, required this.icon});

  final String? title;
  final IconData? icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.meals: TabItemData(title: 'Meals', icon: Icons.food_bank),
    TabItem.account: TabItemData(title: 'Account', icon: Icons.person),
  };
}
