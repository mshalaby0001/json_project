import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_project/bussiness%20logic/user.dart';
import 'package:json_project/data%20layer/json_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Flutter Demo',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) { 
    // access data source
    String jsonData = JsonData.jsonString;

    // deserialize 
    // converting string to map
    Map<String,dynamic> userMap = jsonDecode(jsonData);
    // conveting map to object 
    User user  = User.fromJson(userMap);

    //serialize 
    // conveting object to map
    Map<String, dynamic> jsonMap = user.tojson();
    // converting map to json
    String json = jsonEncode(jsonMap);
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
        title: Text(widget.title),
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(
              'data from json to object (deserialization): ${user.name}',
            ), 
              Text(
              'data from object to json (serialization) : ${json}',
            ), 
          ],
        ),
      ), 
    );
  }
}
