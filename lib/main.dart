import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resplash/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperHub',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done){
            //print("Success");
            return Home();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}