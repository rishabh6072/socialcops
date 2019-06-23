import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

import '../../model/form-model.dart';

class Date extends StatefulWidget {
  final Fields fields;
  final Map<String, dynamic> inputData;

  Date({@required this.fields, this.inputData});

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime.now().add(Duration(days: 0)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
       widget.inputData[widget.fields.id] = formatDate(picked, [mm, '/', dd, '/', yyyy]);
      });
  }

  @override
  Widget build(BuildContext context) {
    widget.inputData[widget.fields.id] = formatDate(DateTime.now(), [mm, '/', dd, '/', yyyy]);

    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () => _selectDate(context),
              child:
                  Text("${formatDate(selectedDate.toLocal(), [mm, '/', dd, '/', yyyy])}"),
            ),
          ],
        ),
      ),
    );
  }
}
