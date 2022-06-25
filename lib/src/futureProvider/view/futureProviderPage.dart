import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/futureProviderController.dart';
import '../model/movieModel.dart';

final futureProvider=FutureProvider.autoDispose<List<Movie>?>((_)=>FutureProviderController().getMovie());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider=ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider Page'),
        centerTitle: true,
      ),
      body: provider.when(
          data: (movieList){
            return ListView.builder(
              itemCount: movieList!.length,
              itemBuilder: (context, index)=> ListTile(
                onTap: (){},
                trailing: Image.network('${movieList[index].poster}'),
                title: Text('${movieList[index].title}'),
                subtitle: Text('${movieList[index].year}'),
              ),
            );
          },
          error: (error, s) => const Center(child: Text('No data found'),),
          loading: () => const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
