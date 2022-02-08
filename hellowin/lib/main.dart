import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(widget.title),
      ),
      pane: NavigationPane(
        selected: _currentIndex,
        onChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
            title: const Text('Page 0'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.accessibilty_checker),
            title: const Text('Page 1'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.arrow_tall_up_left),
            title: const Text('Page 2'),
          ),
        ],
      ),
      content: NavigationBody(
        index: _currentIndex,
        children: [
          ScaffoldPage(
            content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                  ),
                  Button(
                    onPressed: _incrementCounter,
                    child: const Icon(FluentIcons.add),
                  ),
                ],
              ),
            ),
          ),
          const ScaffoldPage(
            content: Text('Page 1'),
          ),
          const ScaffoldPage(
            content: Text('Page 2'),
          ),
        ],
      ),
    );
  }
}
