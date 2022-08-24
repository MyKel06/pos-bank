import 'package:flutter/material.dart';
import 'package:pos/screens/welcome.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pos/screens/home_screen.dart';

Future<bool> checkFirstTime() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool? loggedin = _prefs.getBool('loggedin');
  String? name = _prefs.getString('name');

  if ((loggedin == false || loggedin == null) && name == null) {
    return true;
  } else {
    return false;
  }
}

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  bool isFirstTime = await checkFirstTime();
  return runApp(PosApp(isFirstTime: isFirstTime));
}

class PosApp extends StatefulWidget {
  final bool isFirstTime;
  const PosApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  State<PosApp> createState() => _PosAppState();
}

class _PosAppState extends State<PosApp> {
  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.isFirstTime ? WelcomeScreen() : const HomeScreen(),
    );
  }
}
