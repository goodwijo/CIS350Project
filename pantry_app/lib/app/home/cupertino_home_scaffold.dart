import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/home/meals/meals_page.dart';
import 'package:pantry_app/app/home/tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold(
      {Key? key,
      required this.currentTab,
      required this.onSelectTab,
      required this.widgetBuilders,
      required this.navigatorKeys})
      : super(key: key);

  final TabItem? currentTab;
  final ValueChanged<TabItem>? onSelectTab;
  final Map<TabItem, WidgetBuilder>? widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>>? navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _buildItem(TabItem.meals),
          _buildItem(TabItem.account),
        ],
        onTap: (index) => onSelectTab!(TabItem.values[index]),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
      tabBuilder: (context, index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
            navigatorKey: navigatorKeys![item],
            builder: (context) {
              return widgetBuilders![item]!(context);
            });
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        itemData!.icon,
      ),
      label: (itemData.title),
    );
  }
}
