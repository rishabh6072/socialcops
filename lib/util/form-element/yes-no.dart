import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class YesNo extends StatelessWidget {
  final Fields fields;
  final _formKey = GlobalKey<FormState>();
  YesNo({@required this.fields});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "${fields.title}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    color: Colors.green,
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  FlatButton(
                    color: Colors.red,
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
