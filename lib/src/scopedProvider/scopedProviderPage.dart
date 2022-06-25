import 'package:flutter/material.dart';

class ScopedProviderPage extends StatelessWidget {
  const ScopedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedProvider Page'),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
