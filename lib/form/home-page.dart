import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/form-model.dart';
import '../util/form-element/form-element.dart';
import 'package:socialcops/form/thankyou-screen.dart';

class HomePage extends StatefulWidget {
  final DynamicForm formData;
  HomePage(this.formData);
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  Map<String, dynamic> inputData = Map();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _buildForm(BuildContext context, Fields fields) {
      Widget formElement;
      String type = fields.type;
      if (type == "short_text") {
        formElement = ShortText(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "dropdown") {
        formElement = Dropdown(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "number") {
        formElement = Number(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "email") {
        formElement = Email(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "phone_number") {
        formElement = PhoneNumber(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "date") {
        formElement = Date(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "yes_no") {
        formElement = YesNo(
          fields: fields,
          inputData: inputData,
        );
      } else if (type == "rating") {
        formElement = Rating(
          fields: fields,
        );
      }
      return formElement;
    }

    return MultiProvider(
      providers: [Provider<Key>.value(value: _formKey)],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Survey',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10.0),
                  children: widget.formData.fields
                      .map(
                        (field) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildForm(context, field),
                            ),
                      )
                      .toList(),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print("==========================FORM DATA===========================");
                    print(inputData);
                    print("============================XXXXXXX===========================");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ThankYouScreen(widget.formData);
                        },
                      ),
                    );
                  }
                },
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 85, vertical: 10),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
