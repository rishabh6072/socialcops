import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class Email extends StatelessWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;
  Email({@required this.fields, this.inputData});

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
        bool emailValid =
            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

        if (value.isEmpty && fields.validations.required) {
          return "${fields.title}";
        }
        if (!emailValid) {
          return 'Invalid Email';
        }
        return null;
      },
    );
  }
}
