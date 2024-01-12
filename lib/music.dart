// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  List<String> songs = [
    'Dandelions',
    'Pink Venom',
    'Batter Up'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]),
            onTap: () {
              // Lakukan sesuatu saat lagu dipilih, seperti memulai pemutaran
              // Misalnya, navigasi ke layar pemutar musik
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MusicPlayerScreen(songName: songs[index])));
            },
          );
        },
      ),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  final String songName;

  const MusicPlayerScreen({Key? key, required this.songName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Playing: $songName'),
            // Widget untuk kontrol pemutaran audio (play, pause, dll.) dapat ditambahkan di sini
          ],
        ),
      ),
    );
  }
}
