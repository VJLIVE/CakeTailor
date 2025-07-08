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

            /// 🔷 Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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

            /// 🔷 Cakes Image
            Center(
              child: Image.asset(
                'assets/cakes.png',
                height: 120,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔷 Options Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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

            const SizedBox(height: 16),

            /// 🔷 Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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

  /// 🔷 Option Card widget
  Widget _optionCard({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      height: 60,
      width: 100,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
