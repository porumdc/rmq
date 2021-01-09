import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rmq/screens/home.dart';
import 'package:flutter/services.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		SystemChrome.setPreferredOrientations([
			DeviceOrientation.portraitUp,
		]);
		return MaterialApp(
			theme: ThemeData(
				primaryColor: Color(0xFF800000),
				accentColor: Color(0xFFA9A9A9),
				textTheme: TextTheme(
					headline1: TextStyle(fontSize: 28.0,),
					headline2: TextStyle(fontSize: 14.0,)
				)
			),
			home: Home(),
		);
	}
}