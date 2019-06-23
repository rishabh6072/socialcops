import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../form/form.dart';
import '../model/form-model.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _buildButton(BuildContext context, int index) {
      var content;
      if (widget.formData.fields.length != index + 1) {
        content = FlatButton(
          onPressed: () {},
          child: Text("Next"),
        );
      } else {
        content = FlatButton(
          onPressed: () {},
          child: Text("Submit"),
        );
      }
      return content;
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
        body: PageView(
          children: widget.formData.fields
              .asMap()
              .map((i, field) => MapEntry(
                    i,
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          DynamicField(
                            fields: field,
                          ),
                          _buildButton(context, i),
                        ],
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
