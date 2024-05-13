import 'package:dio/dio.dart';
import 'package:untitled1/core/utills/Constants.dart';

class ApiServices{
  final Dio _dio=Dio(

    BaseOptions( 
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {
        'Content-Type': 'application/json',
        'lang':'en',
         'Authorization':Token

      }
    )
  );
  final  _baseUrl="https://student.valuxapps.com/api/";


  Future<Response> get({required String endPoints})async{

  var response = await  _dio.get('$_baseUrl$endPoints');
  return response;
  }


  Future<Response> post({
    required String endPoints,
    Map<String,dynamic>? query,
   required Map<String,dynamic>? data,

  }
      )async{

    var response = await  _dio.post(endPoints,
      data: data,
      queryParameters: query


    );
    return response;
  }
  Future<Response> put({
    required String endPoints,
    Map<String,dynamic>? query,
    required Map<String,dynamic>? data,

  }
      )async{

    var response = await  _dio.put(endPoints,
        data: data,
        queryParameters: query


    );
    return response;
  }

}