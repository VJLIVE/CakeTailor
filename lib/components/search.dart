import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> cakes = [
    {'name': 'Chota Bheem', 'image': 'assets/searchFeature/chotabheem.jpg'},
    {'name': 'Cindrella', 'image': 'assets/searchFeature/cindrella.jpg'},
    {'name': 'Fondant Superhero Cake', 'image': 'assets/searchFeature/fondant_superhero_cake.jpg'},
    {'name': 'Frozen', 'image': 'assets/searchFeature/frozen.jpg'},
    {'name': 'Iron Man', 'image': 'assets/searchFeature/ironman.jpg'},
    {'name': 'Mermaid', 'image': 'assets/searchFeature/mermaid.jpg'},
    {'name': 'Minions', 'image': 'assets/searchFeature/minions.jpg'},
    {'name': 'Number', 'image': 'assets/searchFeature/number.jpg'},
    {'name': 'Spiderman', 'image': 'assets/searchFeature/spiderman.jpg'},
    {'name': 'Unicorn', 'image': 'assets/searchFeature/unicorn.jpg'},
  ];

  late List<Map<String, String>> filteredCakes;

  @override
  void initState() {
    super.initState();
    filteredCakes = List.from(cakes);
    _searchController.addListener(_filterCakes);
  }

  void _filterCakes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredCakes = List.from(cakes);
      } else {
        filteredCakes = cakes
            .where((cake) => cake['name']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
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
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: filteredCakes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final cake = filteredCakes[index];
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cake['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cake['name']!,
                        style: const TextStyle(fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
