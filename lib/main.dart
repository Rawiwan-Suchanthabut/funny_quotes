import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'อยากมอนิ่งเธอทุกวัน ติดตรงเราตื่นเที่ยง',
    'แม่ใช้ให้เด็ดพริก 10 เม็ด แต่ฉันเด็ด 11 เม็ด เพราะฉันเด็ดเกิน',
    'ก็มีแต่โจรนั่นแหละ ที่มันลักจริง',
    'เริ่มกลับมาร้อนแล้ว ไม่ใช่อากาศนะ เงิน',
    'หน้าไม่หวานส่วนปากไม่ต้องถาม หมาแน่นอน'
  ];

  var quote = quoteList[0]; //state variable

  List colors = [Colors.pink, Colors.amber, Colors.cyan, Colors.lightGreen];
  Random random = new Random();
  int index = 0;

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];

      index = random.nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แคปชั่นกวนๆ เสี่ยวๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote, //positional parameter/argument
            //named parameter/argument
            style: TextStyle(
              color: colors[index],
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
