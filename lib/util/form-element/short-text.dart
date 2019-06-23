import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class ShortText extends StatelessWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;

  ShortText({@required this.fields, this.inputData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: '${fields.title}',
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      onSaved: (text) {
        inputData[fields.id] = text;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "${fields.title}";
        }
        return null;
      },
    );
  }
}
