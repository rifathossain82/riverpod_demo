import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider=StateProvider.autoDispose<int>((_)=>0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value= ref.watch(stateProvider.state);
    var state=ref.watch(stateProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('StateProvider Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${value.state}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.grey),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          state.state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
