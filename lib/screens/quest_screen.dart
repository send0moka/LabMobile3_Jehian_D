import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class QuestScreen extends StatefulWidget {
  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  int _currentStep = 0;
  List<String> _questSteps = [
    'Find the ancient artifact',
    'Defeat the dragon',
    'Save the princess',
    'Return to the castle',
  ];

  void _completeStep() {
    if (_currentStep < _questSteps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      _showQuestCompleteDialog();
    }
  }

  void _showQuestCompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quest Complete!'),
          content: Text('Congratulations, you have completed the quest!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Quest'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/quest_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            _questSteps[_currentStep],
                            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                      SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: (_currentStep + 1) / _questSteps.length,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _completeStep,
                child: Text('Complete Step'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: SideMenu(),
    );
  }
}