import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './form/welcome-screen.dart';
import './model/form-model.dart';

const String FORM_URL =
    "https://firebasestorage.googleapis.com/v0/b/collect-plus-6ccd0.appspot.com/o/mobile_tasks%2Fform_task.json?alt=media&token=d048a623-415e-41dd-ad28-8f77e6c546be";

Future<DynamicForm> fetchSurvey() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final response = await http.get(FORM_URL);
  if (response.statusCode == 200) {
    await prefs.setString('data', response.body);
    return DynamicForm.fromJson(json.decode(prefs.getString('data')));
  } else {
    throw Exception('Failed to load survey');
  }
}

Future<DynamicForm> getDatLocally() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.get('data') == null) {
    return fetchSurvey();
  } else {
    return DynamicForm.fromJson(json.decode(prefs.getString('data')));
  }
}

void main() => runApp(MyApp(formData: getDatLocally()));

class MyApp extends StatelessWidget {
  final Future<DynamicForm> formData;
  MyApp({Key key, this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.cyan
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<DynamicForm>(
            future: formData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WelcomeScreen(formData: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
