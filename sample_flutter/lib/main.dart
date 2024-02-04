// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String _printText = "";
  void _reqestToSpring() async {
    _printText = "";

    // GETリクエストの例
    var response = await http.get(Uri.parse('http://localhost:8080/api/hello'));
    _printText = 'Response from Spring Boot: ${response.body}';

    // POSTリクエストの例
    var postData = {'key': 'value'};
    var postResponse = await http.post(
      Uri.parse('http://localhost:8080/api/postExample'),
      body: postData,
    );
    _printText += 'Response from Spring Boot: ${postResponse.body}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'reqest result:',
            ),
            Text(
              '$_printText',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reqestToSpring,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
