import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void _changeColors() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.white ? Colors.blue : Colors.white;
      _textColor = _textColor == Colors.black ? Colors.white : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('تغییر رنگ پس‌زمینه و متن'),
        ),
        body: GestureDetector(
          onTap: _changeColors,  // تغییر رنگ‌ها هنگام کلیک روی صفحه
          child: Container(
            color: _backgroundColor,
            child: Center(
              child: Text(
                'این متن تغییر رنگ می‌دهد!',
                style: TextStyle(color: _textColor, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
