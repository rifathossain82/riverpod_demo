import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider=StreamProvider.autoDispose((_)=>Stream.periodic(
    Duration(seconds: 1),
    (second)=> '$second'
));

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final second=ref.watch(streamProvider);
    final stream=ref.watch(streamProvider.stream);
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamProvider Page'),
        centerTitle: true,
      ),
      body: Center(
        child: second.when(
            data: (_)=>Text('${second.value}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 42, color: Colors.grey),),
            error: (__, _)=> Text('No Data Found'),
            loading: ()=> CircularProgressIndicator(),
        ),
      ),
    );
  }
}


//with streamBuilder
/*
 StreamBuilder(
        stream: stream,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          else{
            return Center(child: Text('${snapshot.data}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 42, color: Colors.grey),));
          }
        },
      ),
 */
