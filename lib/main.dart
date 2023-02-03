import 'package:flutter/cupertino.dart';
import 'package:outcaster_2/GlobalVar.dart';

void main() {
  runApp(
    const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(
          controller: GlobalVar.tabController,
          tabBuilder: (context, i) {
            return CupertinoTabView(
              builder: (context) {
                return GlobalVar.stores[i];
              },
            );
          },
          backgroundColor: CupertinoColors.extraLightBackgroundGray,
          tabBar: CupertinoTabBar(
            onTap: (val) {
              setState(() {});
            },
            height: 60,
            backgroundColor: CupertinoColors.extraLightBackgroundGray,
            activeColor: CupertinoColors.link,
            inactiveColor: CupertinoColors.inactiveGray,
            iconSize: 25,
            currentIndex: i,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Products"
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search"
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                label: "Cart"
              ),
            ],
          ),
        ));
  }
}
