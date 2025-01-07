import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('تغییر رنگ پس‌زمینه و متن'),
      ),
      body: GestureDetector(
        onTap: _changeColors,
        child: Container(
          color: _backgroundColor,
          child: Center(
            child: Text('این متن تغییر رنگ می‌دهد!',style: TextStyle(color: _textColor,fontSize: 24),),
          ),
        ),
      )
    );
  }
}
