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
    return Container(
      height: 60, // 👈 set to 60
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8EDE6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          IconData icon;
          switch (index) {
            case 0:
              icon = Icons.home_outlined;
              break;
            case 1:
              icon = Icons.cake_outlined;
              break;
            case 2:
              icon = Icons.shopping_cart_outlined;
              break;
            case 3:
              icon = Icons.person_outline;
              break;
            default:
              icon = Icons.circle;
          }

          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              decoration: isActive
                  ? const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              )
                  : null,
              padding: const EdgeInsets.all(8), // 👈 smaller padding to fit in 60px height
              child: Icon(
                icon,
                size: 24, // 👈 slightly smaller icon
                color: isActive ? Colors.white : Colors.brown[300],
              ),
            ),
          );
        }),
      ),
    );
  }
}
