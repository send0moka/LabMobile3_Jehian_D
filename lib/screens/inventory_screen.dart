import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';

class InventoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'name': 'Sword', 'icon': Icons.hardware},
    {'name': 'Shield', 'icon': Icons.shield},
    {'name': 'Potion', 'icon': Icons.local_drink},
    {'name': 'Map', 'icon': Icons.map},
    {'name': 'Compass', 'icon': Icons.explore},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.brown[100]!, Colors.brown[400]!],
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildInventoryItem(items[index]);
          },
        ),
      ),
      drawer: SideMenu(),
    );
  }

  Widget _buildInventoryItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[100],
        border: Border.all(color: Colors.brown, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'], size: 40, color: Colors.brown),
          SizedBox(height: 8),
          Text(item['name'], style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}