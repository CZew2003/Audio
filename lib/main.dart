import 'package:flutter/material.dart';
import 'package:tema3_atelier_digital/widgets/card_widget.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final audioPlayer = AudioPlayer();

  List<String> names = [
    'Salut',
    'Salut (germana)',
    'ma numesc',
    'ma numesc (germana)',
    'cum esti?',
    'cum esti? (germana)',
    'sunt bine',
    'sunt bine (germana)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          'Basic Phrases',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: names.length,
        itemBuilder: (_, index) {
          return CardWidget(
            toggleOnPressed: () async {
              await audioPlayer.play(AssetSource('0${index + 1}.mp3'));
            },
            text: names[index],
          );
        },
      ),
    );
  }
}
