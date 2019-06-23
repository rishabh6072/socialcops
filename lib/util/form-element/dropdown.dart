import 'package:flutter/material.dart';

import '../../model/form-model.dart';

class Dropdown extends StatefulWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;
  Dropdown({@required this.fields, this.inputData});

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
    for (int i = 0; i < widget.fields.properties['choices'].length; i++) {
      data.add(widget.fields.properties['choices'][i]['label']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(25),
      //   border: Border.all(
      //     color: Colors.grey,
      //     width: 1.0,
      //   ),
      // ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          // isExpanded: true,
          validator: (String value) {
            if (value?.isEmpty ?? true) {
              if (widget.fields.validations.required) {
                return '${widget.fields.title}';
              }
            }
            return null;
          },
          hint: Text(widget.fields.title),
          items: data.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: selected,
          onChanged: (_) {
            setState(() {
              widget.inputData[widget.fields.id] = _;
              selected = _;
            });
          },
        ),
      ),
    );
  }
}
