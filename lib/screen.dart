import 'package:flutter/material.dart';
import 'package:flutter10/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import 'contact.dart';
import 'music.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {

  void contact() async {
    if (await Permission.contacts.status.isGranted) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => contactScreen()));
    } else {
      var status = await Permission.contacts.request();
      print(status);
      if (status == PermissionStatus.granted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => contactScreen()));
      } else if ( status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }

  void camera() async{
    if(await Permission.camera.status.isGranted){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => cameraScreen()));
    } else {
      var status = await Permission.camera.request();
      print(status);
      if (status == PermissionStatus.granted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => cameraScreen()));
      } else if ( status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }

  void music() async {
    if (await Permission.storage.status.isGranted) {
      // Lakukan navigasi ke layar musik
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicScreen()));
    } else {
      var status = await Permission.storage.request();
      print(status);
      if (status == PermissionStatus.granted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicScreen()));
      } else if (status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: contact, child: Text('contact')),
            ElevatedButton(onPressed: camera, child: Text('camera')),
            ElevatedButton(onPressed: music, child: Text('music')),
          ],
        ),
      ),
    );
  }
}