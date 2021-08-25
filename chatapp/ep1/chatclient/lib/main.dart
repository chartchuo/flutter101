import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dart_nats/dart_nats.dart' as nats;
import 'model.dart';

main(List<String> args) {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ChatMessage> messages = [];
  var chatClient = nats.Client();
  var text = '';
  int currentMessageId = 0;

  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() async {
    await chatClient.tcpConnect('192.168.1.42');
    var sub = chatClient.sub('chatroom.1.pub');
    sub.stream?.listen((msg) {
      setState(() {
        messages.add(ChatMessage.fromJson(jsonDecode(msg.string)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(
                    messages[i].string,
                    textAlign: messages[i].clientId == chatClient.info!.clientId
                        ? TextAlign.right
                        : null,
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (t) {
                    text = t;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var msg = ChatMessage(
                        currentMessageId, chatClient.info!.clientId ?? 0, text);
                    currentMessageId++;
                    chatClient.pubString(
                        'chatroom.1.send', jsonEncode(msg.toJson()));
                  },
                  child: Text('Send')),
            ],
          )
        ],
      ),
    );
  }
}
