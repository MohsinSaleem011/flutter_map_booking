import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_map_booking/Networking/modeldriver.dart/otp.dart';
import 'package:meta/meta.dart';

import '../config.dart';
import '../data/Model/get_routes_request_model.dart';
import 'json_message.dart';
import 'web_api_client.dart';
import 'package:http/http.dart'as http;

class Apis {
  static const domain = 'https://maps.googleapis.com/maps/api/directions/json';
  static final GMapClient _gmapClient = GMapClient();

  Apis();

  getHttp(String query) async {
    try {
      Response response = await Dio().get('$domain?$query');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<JsonMessage> getRoutes({required GetRoutesRequestModel getRoutesRequest}) async {
    return await _gmapClient.fetch(
      url: domain,
      key: Config.apiKey,
      queryParameters: getRoutesRequest.toJson(),
    );
  }

   Future<Userotplogin?> postOtp(String mobile_no) async {
    String baseUrl =
        "https://giro.ly/api/user/test_login";
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'type': "user",
          'mobile': mobile_no,
          
        },
      ),
    );
    print(res.body.toString());
    if (res.statusCode == 200) {
     
    
      return Userotplogin.fromJson(jsonDecode(res.body));
    } 
   
    
    else(e) {
      throw (e.toString());
      };
  }

  }