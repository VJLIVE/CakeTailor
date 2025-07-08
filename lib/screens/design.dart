import 'package:flutter/material.dart';
import '../components/navbar.dart';
import 'home.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EDE6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔷 Header section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.sticky_note_2_outlined, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            /// 🔷 Title text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pick Your\nFavorite Choice',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            /// 🔷 Cakes Image (on the right, bigger)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/cakes.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 24),
            /// 🔷 Options Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _optionCard(
                    icon: Icons.search,
                    label: 'Search',
                    color: const Color(0xFFB77B4E),
                    textColor: Colors.white,
                  ),
                  _optionCard(
                    icon: Icons.image_outlined,
                    label: 'Upload',
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                  _optionCard(
                    icon: Icons.cake_outlined,
                    label: 'Manual',
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// 🔷 Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
          // For index 1 you’re already here.
          if (index == 2) {
            // Navigate to CartPage if you create it
          }
          if (index == 3) {
            // Navigate to ProfilePage if you create it
          }
        },
      ),
    );
  }

  Widget _optionCard({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      height: 50,
      width: 100, // 👈 reduced from 120 to fit 3 cards in a row
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 4), // 👈 reduced gap between icon & text
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12, // slightly smaller if needed
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
