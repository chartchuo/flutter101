import 'package:dart_nats/dart_nats.dart' as nats;

void main(List<String> arguments) async {
  var chatServer = nats.Client();
  await chatServer.connect(Uri.parse('nats:localhost'));
  var receive = chatServer.sub('chatroom.1.send');
  receive.stream.listen((msg) {
    print(msg.string);
    chatServer.pubString('chatroom.1.pub', msg.string);
  });
}
