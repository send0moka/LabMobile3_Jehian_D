import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _shakeAnimation = Tween(begin: -5.0, end: 5.0).animate(_shakeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _shakeController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_usernameController.text == 'hero' && _passwordController.text == 'quest') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _usernameController.text);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _shakeController.forward(from: 0.0);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials! Try "hero" and "quest".')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pixel_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Pixel Quest',
                            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                      SizedBox(height: 20),
                      _buildPixelatedTextField(_usernameController, 'Username'),
                      SizedBox(height: 10),
                      _buildPixelatedTextField(_passwordController, 'Password', isPassword: true),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Start Adventure'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPixelatedTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}