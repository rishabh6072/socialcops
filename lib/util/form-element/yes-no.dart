import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../../model/form-model.dart';

class YesNo extends StatefulWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;
  YesNo({@required this.fields, this.inputData});

  @override
  _YesNoState createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  String _picked = "Yes";
  @override
  Widget build(BuildContext context) {
    widget.inputData[widget.fields.id] = _picked;
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${widget.fields.title}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
          ),
          Center(
            child: RadioButtonGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 3, 0.0, 0.0, 0.0),
              onSelected: (String selected) => setState(() {
                    _picked = selected;
                    widget.inputData[widget.fields.id] = selected;
                  }),
              labels: <String>[
                "Yes",
                "No",
              ],
              picked: _picked,
              itemBuilder: (Radio rb, Text txt, int i) {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    rb,
                    txt,
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
