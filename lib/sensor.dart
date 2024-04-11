import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<SensorData?> getSensorData() async {
  final ref = FirebaseDatabase.instance.ref("sensorData");

  try {
    final event = await ref.once();
    final snapshot = event.snapshot; // Access the DataSnapshot from the event
    if (snapshot.exists) {
      final data = snapshot.value as Map<String, dynamic>;
      final pressure = data["pressure"] as double?;
      final count = data["count"] as int?;
      return SensorData(pressure: pressure, count: count);
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

  SensorData({this.pressure, this.count});
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
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Count: ${_sensorData?.count ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
