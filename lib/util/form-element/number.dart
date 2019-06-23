import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class Number extends StatelessWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;
  Number({@required this.fields, this.inputData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
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
        if (value.isEmpty && fields.validations.required) {
          return "${fields.title}";
        }
        return null;
      },
    );
  }
}
