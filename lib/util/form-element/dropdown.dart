import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class Dropdown extends StatefulWidget {
  final Fields fields;
  Dropdown({@required this.fields});

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> data = [];
  String selected;
  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    print(widget.fields.properties['choices'].length);
    for (int i = 0; i < widget.fields.properties['choices'].length; i++) {
      data.add(widget.fields.properties['choices'][i]['label']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new DropdownButton<String>(
        hint: Text(widget.fields.type),
        items: data.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        value: selected,
        onChanged: (_) {
          setState(() {
            selected = _;
          });
        },
      ),
    );
  }
}
