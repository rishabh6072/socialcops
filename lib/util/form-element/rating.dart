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
  final _formKey = GlobalKey<FormState>();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {
            setState(() {
              rating = v;
            });
          },
          starCount: 5,
          rating: rating,
          size: 40.0,
          color: Colors.cyan,
          borderColor: Colors.black,
          spacing: 0.0),
    );
  }
}
