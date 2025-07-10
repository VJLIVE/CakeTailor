import 'package:flutter/material.dart';
import '../components/navbar.dart';
import 'home.dart';
import '../components/search.dart';
import '../components/upload.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  int selectedOption = 0; // 0 = Search, 1 = Upload, 2 = Manual

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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
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

            /// 🔷 Cakes Image (on the right)
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
            const SizedBox(height: 16),

            /// 🔷 Options Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _optionCard(
                    icon: Icons.search,
                    label: 'Search',
                    color: selectedOption == 0 ? const Color(0xFFB77B4E) : Colors.white,
                    textColor: selectedOption == 0 ? Colors.white : Colors.black,
                    onTap: () {
                      setState(() => selectedOption = 0);
                    },
                  ),
                  _optionCard(
                    icon: Icons.image_outlined,
                    label: 'Upload',
                    color: selectedOption == 1 ? const Color(0xFFB77B4E) : Colors.white,
                    textColor: selectedOption == 1 ? Colors.white : Colors.black,
                    onTap: () {
                      setState(() => selectedOption = 1);
                    },
                  ),
                  _optionCard(
                    icon: Icons.cake_outlined,
                    label: 'Manual',
                    color: selectedOption == 2 ? const Color(0xFFB77B4E) : Colors.white,
                    textColor: selectedOption == 2 ? Colors.white : Colors.black,
                    onTap: () {
                      setState(() => selectedOption = 2);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔷 Selected View
            Expanded(
              child: _getSelectedView(),
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

  Widget _getSelectedView() {
    if (selectedOption == 0) {
      return const SearchWidget();
    } else if (selectedOption == 1) {
      return const UploadWidget();
    } else {
      return const Center(
        child: Text(
          'Manual Coming Soon!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _optionCard({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
