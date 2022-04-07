import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = "";
  String deviceModel = "";
  void getId() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.androidId.toString();
    deviceModel = androidInfo.model.toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Devive ID EX')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text('Device Id - $deviceId')),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('Device Model - $deviceModel')),
        ],
      ),
    );
  }
}
