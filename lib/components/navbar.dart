import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      items: [
        _buildNavItem(icon: Icons.home, index: 0),
        _buildNavItem(icon: Icons.cake_outlined, index: 1),
        _buildNavItem(icon: Icons.shopping_cart_outlined, index: 2),
        _buildNavItem(icon: Icons.person_outline, index: 3),
      ],
    );
  }

  /// Helper to build each BottomNavigationBarItem
  BottomNavigationBarItem _buildNavItem({required IconData icon, required int index}) {
    return BottomNavigationBarItem(
      icon: _NavIcon(
        icon: icon,
        selected: index == currentIndex,
      ),
      label: '',
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const _NavIcon({required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      );
    } else {
      return Icon(
        icon,
        color: Colors.grey,
        size: 24,
      );
    }
  }
}
