import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
	fillColor: Colors.white,
	filled: true,
	enabledBorder: OutlineInputBorder(
		borderSide: BorderSide(color: Colors.white, width: 2.0)),
	focusedBorder: OutlineInputBorder(
		borderSide: BorderSide(color: rmqPrimaryColor, width: 2.0)),
);

const boxBorderDecoration = BoxDecoration(
	border: Border(
		top: BorderSide(
			width: 2.0,
			color: rmqPrimaryColor,
		),
	),
);

const rmqPrimaryColor = Color(0xFF800000);
const rmqSecondaryColor = Color(0xFFA9A9A9);
