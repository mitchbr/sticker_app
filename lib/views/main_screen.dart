import 'package:flutter/material.dart';

import 'package:sticker_map/views/sticks_list.dart';
import 'package:sticker_map/views/stickers_list.dart';

class MainScreenLayout extends StatefulWidget {
  const MainScreenLayout({Key? key}) : super(key: key);

  @override
  State<MainScreenLayout> createState() => _MainScreenLayoutState();
}

class _MainScreenLayoutState extends State<MainScreenLayout> {
  List<Widget> _views = [];
  var selectedIndex = 0;

  @override
  void initState() {
    _views = [const SticksList(), const StickersList()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: _views.length, child: Builder(builder: (context) => mainScaffold(context)));
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget mainScaffold(BuildContext context) {
    return Scaffold(
      body: _views.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Stickers',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
