import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/theme.dart';
import 'custom_widgets/custom_appbar.dart';
import 'features/cart/cart_screen.dart';
import 'features/home/home_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/wishlist/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.white,
        ),
        //useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: Center(
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: GNav(
            tabBorderRadius: 100,
            backgroundColor: Colors.white,
            activeColor: Colors.black,
            hoverColor: Colors.grey,
            haptic: true,
            duration: const Duration(milliseconds: 100),
            rippleColor: Colors.transparent,
            gap: 3,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: "WishList",
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: "Bag",
              ),
              GButton(
                icon: Icons.menu_outlined,
                text: "Menu",
              ),
            ],
            onTabChange: (index) {
              setState(() {
                if (kDebugMode) {
                  print("index num is $index");
                }
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
