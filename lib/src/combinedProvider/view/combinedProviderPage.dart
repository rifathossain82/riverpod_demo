import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/src/combinedProvider/controller/combinedController.dart';
import 'package:riverpod_demo/src/combinedProvider/model/dataModel.dart';

final movieNameProvider=Provider((_)=> 'Superman');

final combinedProvider=FutureProvider.autoDispose<List<Movie>?>((_){
  var movieName=_.watch(movieNameProvider);
  return CombinedProviderController().getMovie(name: movieName);
});

class CombinedProviderPage extends ConsumerWidget {
  const CombinedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider=ref.watch(combinedProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('CombinedProvider Page'),
        centerTitle: true,
      ),
      body: provider.when(
          data: (data)=>ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text('${data[index].title}'),
                subtitle: Text('${data[index].year}'),
                trailing: Image.network('${data[index].poster}'),
              );
            },
          ),
          error: (error, _) => Center(child: Text('No Data Found')),
          loading: () => Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
