import 'dart:convert';

//import 'package:api_imtegration_demo/model/factResponse.dart';
import 'package:api_task/models/factResponse.dart';
import 'package:http/http.dart' as http;


class DataServices{
  Future<FactResponse>getData()async{
    http.Response response;
    response=await http.get(Uri.parse("https://reqres.in/api/users?page=2 "));
    if(response.statusCode==200){
      print(response.statusCode);
      FactResponse factResponse=FactResponse.fromJson(json.decode(response.body));
      print(factResponse);
      return factResponse;



    }
    else{
      throw Exception(['Invalid Status Code']);

    }
  }
}