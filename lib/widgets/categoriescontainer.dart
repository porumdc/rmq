import 'package:flutter/material.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/screens/categories.dart';

class CategoriesContainer extends StatefulWidget {

	final String categoryName;

	CategoriesContainer({Key key, @required this.categoryName}) : super(key: key);

	@override
	_CategoriesContainerState createState() => _CategoriesContainerState(categoryName);
}

class _CategoriesContainerState extends State<CategoriesContainer> {

	String categoryName;
	_CategoriesContainerState(this.categoryName);

	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width / 2,
			height: MediaQuery.of(context).size.width / 2,
			child: FlatButton(
				onPressed: () async {
					Navigator.push(
						context, MaterialPageRoute(
							builder: (context) => CategoriesScreen(),
							settings: RouteSettings(
								arguments: categoryName,
							),
						),
					);
				},
				child: Container(
					padding: EdgeInsets.all(10.0),
					child: Text(categoryName),
					decoration: BoxDecoration(
						border: Border.all(
							width: 3.0,
							color: rmqPrimaryColor,
						),
					)
				),
			),
		);
	}
}