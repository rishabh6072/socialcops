import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../model/form-model.dart';

class Rating extends StatefulWidget {
  final Fields fields;
  Rating({@required this.fields});

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            "${widget.fields.title}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
          ),
          SmoothStarRating(
            allowHalfRating: false,
            onRatingChanged: (v) {
              setState(() {
                rating = v;
              });
            },
            starCount: 5,
            rating: rating,
            size: 40.0,
            color: Theme.of(context).accentColor,
            borderColor: Colors.black,
            spacing: 0.0,
          ),
        ]),
      ),
    );
  }
}
