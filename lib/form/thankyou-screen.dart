import 'package:flutter/material.dart';

import 'package:socialcops/model/form-model.dart';
import 'package:socialcops/util/form-element/thanks.dart';

class ThankYouScreen extends StatefulWidget {
  final DynamicForm formData;
  ThankYouScreen(this.formData);
  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  PageController controller = PageController();
  List<Widget> formElements = [];
  Widget formElement;
  @override
  void initState() {
    super.initState();
    buildPages();
  }

  buildPages() {
    widget.formData.thankyouScreens.asMap().forEach((index, data) {
      formElement = ThanksBuilder(
        thankyouScreens: data,
      );
      formElements.add(formElement ?? Container());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Thank You',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: PageView(
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: formElements.map((element) {
                    return Container(
                      child: Center(
                        child: element,
                      ),
                    );
                  }).toList()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Icon(Icons.arrow_left),
              ),
              RaisedButton(
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Icon(Icons.arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
