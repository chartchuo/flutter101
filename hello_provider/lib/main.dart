import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'state.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Todo(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
