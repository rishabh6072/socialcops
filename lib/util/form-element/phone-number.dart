import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class PhoneNumber extends StatelessWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;
  PhoneNumber({@required this.fields, this.inputData});

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
        bool isEmpty = value.isEmpty;
        if (isEmpty && fields.validations.required) {
          return "${fields.title}";
        }
        bool phoneValid =
            RegExp(r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$").hasMatch(value);
        if(!phoneValid && !isEmpty) {
          return "Invalid number";
        }
        return null;
      },
    );
    ;
  }
}
