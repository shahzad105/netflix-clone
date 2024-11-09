import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/HomeScreen.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  // List of screens that the bottom navigation bar will switch between
  List<Widget> _screens = [
    const HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    const Scaffold(), // Placeholder for Search
    const Scaffold(), // Placeholder for Coming Soon
    const Scaffold(), // Placeholder for Downloads
    const Scaffold(), // Placeholder for More
  ];

  // Icons and labels for the bottom navigation bar
  Map<String, IconData> _icons = {
    "Home": Icons.home,
    "Search": Icons.search,
    "Comming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.more,
  };

  // Track the selected index for the bottom navigation
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      // Bottom navigation bar to switch between screens
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Dark background for Netflix style
        selectedItemColor: Colors.white, // White color for selected items
        unselectedItemColor:
            Colors.grey[600], // Lighter color for unselected items
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold), // Bold text for selected item
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal), // Normal text for unselected items
        type: BottomNavigationBarType.fixed, // For non-shifting items
        elevation: 10, // Elevation to give a floating effect
        items: _icons.entries.map((entry) {
          return BottomNavigationBarItem(
            icon: Icon(
              entry.value,
              size: 28, // Slightly larger icon size
            ),
            label: entry.key,
          );
        }).toList(),
      ),
    );
  }
}
