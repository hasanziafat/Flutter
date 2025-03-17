import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDarkMode = await getThemePreference();
  runApp(MyApp(isDarkMode: isDarkMode));
}

Future<bool> getThemePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isDarkMode') ?? false;
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  MyApp({required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void _toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool('isDarkMode', _isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('تغییر تم برنامه'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: Center(
          child: Text('حالت فعلی: ${_isDarkMode ? "تاریک" : "روشن"}'),
        ),
      ),
    );
  }
}
