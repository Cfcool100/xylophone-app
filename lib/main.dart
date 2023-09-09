import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: XylophoneApp(),
      ),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void soundPlayer(int x) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$x.wav'),
    );
  }

  ButtonStyle flatButtonStyle(Color backgroundColor) {
    return ButtonStyle(
      enableFeedback: false,
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide.none,
        ),
      ),
    );
  }

  buttonKey(Color backgroudColor, int x) {
    return Expanded(
      child: TextButton(
        style: flatButtonStyle(backgroudColor),
        onPressed: () {
          soundPlayer(x);
        },
        child: SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buttonKey(Colors.red, 1),
          buttonKey(Colors.orange, 2),
          buttonKey(Colors.yellow, 3),
          buttonKey(Colors.green, 4),
          buttonKey(Colors.teal, 5),
          buttonKey(Colors.blue, 6),
          buttonKey(Colors.purple, 7),
        ],
      ),
    );
  }
}
