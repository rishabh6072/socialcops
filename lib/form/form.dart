import 'package:flutter/material.dart';

import '../util/form-element/date.dart';
import '../model/form-model.dart';
import '../util/form-element/form-element.dart';

class DynamicField extends StatefulWidget {
  Function(bool) isValidated;
  final Fields fields;
  DynamicField({@required this.fields});
  @override
  _DynamicFieldState createState() => _DynamicFieldState();
}

class _DynamicFieldState extends State<DynamicField> {
  Widget formElement;

  @override
  void initState() {
    super.initState();
    buildForm(widget.fields);
  }

  buildForm(fields) {
    String type = fields.type;
    if (type == "short_text") {
      print("short_text");
      formElement = ShortText(
        fields: fields,
      );
    } else if (type == "dropdown") {
      print("dropdown");
      formElement = Dropdown(
        fields: fields,
      );
      setState(() {});
    } else if (type == "number") {
      formElement = Number(
        fields: fields,
      );
    } else if (type == "email") {
      formElement = Email(
        fields: fields,
      );
    } else if (type == "phone_number") {
      formElement = PhoneNumber(
        fields: fields,
      );
    } else if (type == "date") {
      formElement = Date(
        fields: fields,
      );
    } else if (type == "yes_no") {
      formElement = YesNo(
        fields: fields,
      );
    } else if (type == "rating") {
      formElement = Rating(
        fields: fields,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: formElement,
    );
  }
}
