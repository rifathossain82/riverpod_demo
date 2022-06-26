import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_demo/src/combinedProvider/model/dataModel.dart';

class CombinedProviderController{
  Future<List<Movie>?> getMovie({String? name})async{
    try{
      List<Movie> movieList=[];
      name=name ?? "batman";
      var apiKey='48553655';
      var api="https://www.omdbapi.com/?s=$name&apikey=$apiKey";

      var response=await http.get(Uri.parse(api));

      //print(response.body);
      //print(response.statusCode);
      var data=jsonDecode(response.body.toString());

      if(response.statusCode==200){
        data=data['Search'];
        for(Map i in data){
          movieList.add(Movie.fromJson(i));
        }
      }
      else{
        print('No Data Found.');
      }


      return movieList;
    }
    catch(e){
      print(e);
    }
  }
}