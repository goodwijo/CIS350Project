import 'package:flutter/material.dart';
import 'package:pantry_app/app/home/account/account_page.dart';
import 'package:pantry_app/app/home/cupertino_home_scaffold.dart';
import 'package:pantry_app/app/home/meals/meals_page.dart';
import 'package:pantry_app/app/home/tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.meals;

  Map<TabItem, WidgetBuilder>? get widgetBuilders {
    return {
      TabItem.meals: (_) => const MealsPage(),
      TabItem.account: (_) => const AccountPage(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
