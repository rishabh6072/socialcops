import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:socialcops/model/form-model.dart';
import 'dart:convert';

import 'package:socialcops/main.dart';

class ThanksBuilder extends StatelessWidget {
  final ThankyouScreens thankyouScreens;

  ThanksBuilder({@required this.thankyouScreens});

  @override
  Widget build(BuildContext context) {
    Future<DynamicForm> getDatLocally() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.get('data') == null) {
        return fetchSurvey();
      } else {
        return DynamicForm.fromJson(json.decode(prefs.getString('data')));
      }
    }

    _buildShare(BuildContext context, ThankyouScreens thankyouScreens) {
      Widget content = SizedBox();
      if (thankyouScreens.properties.shareIcons) {
        content = Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            FlatButton.icon(
              icon: Icon(Icons.share),
              label: Text(''),
              onPressed: () {},
            )
          ],
        );
      }
      return content;
    }

    _buildButtons(BuildContext context, ThankyouScreens thankyouScreens) {
      Widget content = SizedBox();
      if (thankyouScreens.properties.showButton) {
        content = Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MyApp(formData: getDatLocally());
                    },
                  ),
                );
              },
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 85, vertical: 10),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text(
                thankyouScreens.properties.buttonText,
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        );
      }
      return content;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          thankyouScreens.title,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        _buildButtons(context, thankyouScreens),
        _buildShare(context, thankyouScreens),
      ],
    );
  }
}
