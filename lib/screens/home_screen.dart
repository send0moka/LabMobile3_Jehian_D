import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/side_menu.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixel Home'),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/home.riv',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome, ${username ?? 'Adventurer'}!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/quest'),
                  child: Text('Start New Quest'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}