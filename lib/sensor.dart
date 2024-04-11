import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<SensorData?> getSensorData() async {
  final ref = FirebaseDatabase.instance.ref("sensorData");

  try {
    final event = await ref.once();
    final snapshot = event.snapshot; // Access the DataSnapshot from the event
    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      final pressure = data["pressure"] as double?;
      final count = data["count"] as int?;
      final humidity = data["humidity"] as double?;
      final temperature = data["temperature"] as double?;
      
      return SensorData(pressure: pressure, count: count, humidity: humidity, temperature: temperature);
    } else {
      print("No sensor data found!");
      return null;
    }
  } catch (error) {
    print("Error getting sensor data: $error");
    return null;
  }
}

class SensorData {
  final double? pressure;
  final int? count;
  final double? humidity;
  final double? temperature;

  SensorData({this.pressure, this.count, this.humidity, this.temperature});
}

class SensorDataView extends StatefulWidget {
  @override
  _SensorDataState createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorDataView> {
  SensorData? _sensorData;
  Future<void> _fetchData() async {
    final data = await getSensorData();
    setState(() {
      _sensorData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Data'),
      ),
      body: Center(
        child: _sensorData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pressure: ${_sensorData?.pressure?.toStringAsFixed(2) ?? 'N/A'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Count: ${_sensorData?.count ?? 'N/A'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temperature: ${_sensorData?.temperature ?? 'N/A'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                 const SizedBox(height: 10),
                  Text(
                    'Humidity : ${_sensorData?.humidity ?? 'N/A'}',
                    style:const TextStyle(fontSize: 18),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
