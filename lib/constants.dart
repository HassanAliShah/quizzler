import 'package:flutter/material.dart';

const KTextField = InputDecoration(
    contentPadding: EdgeInsets.only(left: 25),
    labelText: '',
    labelStyle: TextStyle(color: Colors.black),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(width: 1.0)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.black, width: 1.0),
    ),
    alignLabelWithHint: false);
