import 'package:flutter/material.dart';
import 'package:dual_screen/dual_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: DualScreenInfo.hasHingeAngleSensor,
        builder: (context, sensorSnapshot) {
          if (sensorSnapshot.hasData && sensorSnapshot.data != true)
            return MainScreen();
          return StreamBuilder<double>(
              stream: DualScreenInfo.hingeAngleEvents,
              builder: (context, hingeSnapshot) {
                print(hingeSnapshot.data);
                if (hingeSnapshot.hasData &&
                    (hingeSnapshot.data! > 150 || hingeSnapshot.data! <= 30))
                  return MainScreen();
                return OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? Column(
                          children: [
                            Expanded(child: MainScreen()),
                            Expanded(child: SubScreen()),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: SubScreen()),
                            Expanded(child: MainScreen()),
                          ],
                        );
                });
              });
        });
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Main Screen'),
      ),
    );
  }
}

class SubScreen extends StatelessWidget {
  const SubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Sub Screen'),
      ),
    );
  }
}
