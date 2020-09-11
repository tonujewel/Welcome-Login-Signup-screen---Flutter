import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

enum Method { POST, GET,PUT,DELETE,PATCH }



class ApiClient{
  static var header={
    'Content-Type':'application/json',
    'Accept':'application/json',
    //'Authorization':'${auth.tokenType} ${auth.accessToken}'
  };

  static Future Request(BuildContext context,{@required String url,Method method=Method.GET,var body,bool enableHeader=false})async{

    var response;
    try{
      if(method==Method.POST)
      {
        if(enableHeader)
          response = await http.post(url,body: body,headers: header);
        else
          response = await http.post(url,body: body);
      }
      else if(method==Method.DELETE){
        response = await http.delete(url);
      }
      else if(method==Method.PATCH){
        response = await http.patch(url,body: body);
      }
      else{
        response = await http.get(url);
      }
      showData(url: url,body: body,method: method,response: response.body);
      if (response.statusCode == 200 || response.statusCode == 401  || response.statusCode==403  || response.statusCode==500 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return{
          'error': 'Something went wrong!'
        };
      }
    }
    catch(e){
      return{
        'error': 'Check your internet connection !'
      };
    }
  }

  static Future RequestWithFile(BuildContext context,{@required String url,Map<String,dynamic> body,List<String> fileKey,List<File> files,Method method=Method.POST})async{
    var result;
    var uri = Uri.parse(url);
    var request ;
    if(method==Method.POST){
      request = new http.MultipartRequest("POST", uri)..fields.addAll(body);
    }
    else if(method==Method.PATCH){
      request = new http.MultipartRequest("PATCH", uri)..headers.addAll(header)..fields.addAll(body);
    }


    for(int i=0;i<fileKey.length;i++){
      var stream = new http.ByteStream(DelegatingStream.typed(files[i].openRead()));
      var length = await files[i].length();
      var multipartFile = new http.MultipartFile(fileKey[i], stream, length, filename: basename(files[i].path));
      request.files.add(multipartFile);
    }

    var response = await request.send();
    await response.stream.transform(utf8.decoder).listen((value) {
      result = value;
      print(result);
    });
    showData(url: url,body: body,method: method,response: result.toString());
    return json.decode(result);
    /*if (response.statusCode == 200 || response.statusCode == 401 || response.statusCode == 422 || response.statusCode == 500 )
    {

    }
    else{
      return{
        'error': language.Something_went_wrong
      };
    }*/
    /*try{
      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 401 || response.statusCode == 422 || response.statusCode == 500 )
      {
        await response.stream.transform(utf8.decoder).listen((value) {
          result = value;
        });
        showData(url: url,body: body,method: method,response: result.toString());
        return json.decode(result);
      }
      else{
        return{
          'error': language.Something_went_wrong
        };
      }
    }
    catch(e){
      return{
        'error': language.Check_your_internet_connection
      };
    }*/

  }


  static void showData({String url, var body, String response,Method method}) {
    if (!kReleaseMode) {
      print("URL = $url");
      print("Body = $body");
      print("Method = $method");
      print("Response = $response");
    }
  }


}

