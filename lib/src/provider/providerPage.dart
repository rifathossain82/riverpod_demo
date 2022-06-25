import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider=Provider((_)=> 'Rifat Hossain');
final counterProvider=Provider<int>((ref)=> 94);

class ProviderPage extends ConsumerWidget {
  ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter=ref.watch(counterProvider).toString();
    var name=ref.watch(nameProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${counter}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.grey),),
            Text('${name}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
