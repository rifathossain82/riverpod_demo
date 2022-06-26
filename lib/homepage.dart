import 'package:flutter/material.dart';
import 'package:riverpod_demo/src/futureProvider/view/futureProviderPage.dart';
import 'package:riverpod_demo/src/provider/providerPage.dart';
import 'package:riverpod_demo/src/stateProvider/stateProviderPage.dart';
import 'package:riverpod_demo/src/streamProvider/streamProviderPage.dart';

import 'src/combinedProvider/view/combinedProviderPage.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  var names=[
    'Provider',
    'StateProvider',
    'FutureProvider',
    'StreamProvider',
    'ScopedProvider',
    'CombinedProvider'
  ];

  var pages=[
    ProviderPage(),
    StateProviderPage(),
    FutureProviderPage(),
    StreamProviderPage(),
    ProviderPage(),
    CombinedProviderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Demo'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index){
          return buildButton(context, index);
        },
      ),
    );
  }

  Widget buildButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[index]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('${names[index]}'),
        )
      ),
    );
  }
}
