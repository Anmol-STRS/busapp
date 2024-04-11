import 'package:busapp/sensor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:busapp/firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sensor Reading',
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sensor Data', style: TextStyle(letterSpacing: 2, color: Colors.white,fontSize: 30)),
        elevation: 4,
        leading: const Icon(Icons.settings_accessibility_rounded,color: Colors.white),
        backgroundColor: Colors.green,
        shadowColor: Colors.white,
      ),
      body: SensorRepresent() ,
    ),
  ));
}

class SensorRepresent extends StatefulWidget {
  const SensorRepresent({super.key});

  @override
  State<SensorRepresent> createState() => _SensorRepresentState();
}

class _SensorRepresentState extends State<SensorRepresent> {
  @override
  Widget build(BuildContext context) {
    return SensorDataView();
}
}