import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async{
  List _currencies = await getCurrencies();
  for(int i = 0; i < _currencies.length; i++){
    print("Name: ${_currencies[i]["name"] }");
    print("Phone: ${_currencies[i]["phone"]}");
    print("address: ${_currencies[i]["address"]["street"]}");
    print("GeoLocation: ${_currencies[i]["address"]["geo"]}");
    print("Company Name: ${_currencies[i]["company"]["name"]}");
    print("Company catchPhrase: ${_currencies[i]["company"]["catchPhrase"]}");
    print("Company bs: ${_currencies[i]["company"]["bs"]}");

  }

  runApp(new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello"),
        ),
      ),
  ));


}

Widget buildRow(int position) {
  return new ListTile(
    title: new Text(""),
  );
}

Future<List> getCurrencies() async{
  String apiUrl = "https://jsonplaceholder.typicode.com/users";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
