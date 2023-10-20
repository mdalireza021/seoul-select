import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:seoul_select/features/bag/bag_screen.dart';
import 'package:seoul_select/features/menu/menu_screen.dart';
import 'package:seoul_select/features/wishlist/wishlist_screen.dart';
import '../home/home_screen.dart';
import 'custom_bottom_nav.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late Map<int, Widget> _pages;
  int _selectedIndex = 0;
  final ListQueue<int> _navigationQueue = ListQueue(0);

  @override
  void initState() {
    _pages = {
      0: const HomeScreen(),
      1: const WishlistScreen(),
      2: const BagScreen(),
      3: const MenuScreen(),
    };
    super.initState();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _navigationQueue.removeWhere((element) => element == index);
      _navigationQueue.addLast(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if(_navigationQueue.isNotEmpty) {
            _navigationQueue.removeLast();
            int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
            _onItemTapped(position);
          }
          return _navigationQueue.isEmpty;
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages.values.toList(),
        ),
      ),
    );
  }
}
