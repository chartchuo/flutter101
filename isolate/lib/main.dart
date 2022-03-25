// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyHome()));
}

int fibonacci(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 2) + fibonacci(n - 1);
}

void workerIsolate(SendPort sendPort) {
  ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) {
    if (message is int) {
      sendPort.send(fibonacci(message));
    }
  });
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int n = 40;
  int? result;
  Future<int>? result2;

  Isolate? isolate;
  ReceivePort receivePort = ReceivePort();
  SendPort? sendPort;

  var streamCtl = StreamController<int>();

  @override
  void initState() {
    super.initState();
    initIsolate();
  }

  @override
  dispose() {
    super.dispose();
    isolate?.kill();
    streamCtl.close();
  }

  initIsolate() async {
    isolate = await Isolate.spawn(workerIsolate, receivePort.sendPort);
    receivePort.listen((message) {
      if (message is SendPort) {
        sendPort = message;
      } else if (message is int) {
        streamCtl.add(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('$result'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = fibonacci(n);
                });
              },
              child: Text('start'),
            ),
            FutureBuilder<int>(
              future: result2,
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result2 = compute<int, int>(fibonacci, n);
                });
              },
              child: Text('start2'),
            ),
            StreamBuilder<int>(
              stream: streamCtl.stream,
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                sendPort?.send(n);
              },
              child: Text('start3'),
            ),
          ],
        ),
      ),
    );
  }
}
