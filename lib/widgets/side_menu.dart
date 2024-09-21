import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.brown[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
                image: DecorationImage(
                  image: AssetImage('assets/menu_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'Pixel Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildMenuItem(context, 'Home', Icons.home, '/home'),
            _buildMenuItem(context, 'Inventory', Icons.inventory, '/inventory'),
            _buildMenuItem(context, 'Quest', Icons.explore, '/quest'),
            _buildMenuItem(context, 'Logout', Icons.exit_to_app, '/login', logout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, String route, {bool logout = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title, style: TextStyle(fontFamily: 'PressStart2P', fontSize: 14)),
      onTap: () async {
        if (logout) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('username');
        }
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}