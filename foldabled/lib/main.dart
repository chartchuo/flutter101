import 'package:dual_screen/dual_screen.dart';
import 'package:flutter/material.dart';

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
        builder: (context, hasSensorSnapshot) {
          if (hasSensorSnapshot.hasData && hasSensorSnapshot.data != true) {
            return MainScreen();
          }

          return StreamBuilder<double>(
              stream: DualScreenInfo.hingeAngleEvents,
              builder: (context, hingeAngleSnapshot) {
                if (hingeAngleSnapshot.hasData &&
                    (hingeAngleSnapshot.data! > 150 ||
                        hingeAngleSnapshot.data! <= 30)) {
                  return MainScreen();
                }
                return OrientationBuilder(builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return Column(
                      children: [
                        Expanded(child: MainScreen()),
                        Expanded(child: SubScreen()),
                      ],
                    );
                  }
                  return Row(
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
