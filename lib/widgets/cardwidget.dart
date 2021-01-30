import 'package:flutter/material.dart';
// import 'package:rmq/screens/editproductform.dart';
import 'package:rmq/shared/constants.dart';

class CardWidget extends StatefulWidget {

	final String productName;
	final String category;
	final String wholesalePrice;
	final String retailPrice;
	final String itemcode;
	final String imageURL;

	CardWidget({Key key, 
		@required this.category, 
		@required this.productName, 
		@required this.retailPrice, 
		@required this.wholesalePrice,
		@required this.itemcode,
		@required this.imageURL}) 
		: super(key: key);

	@override
	_CardWidgetState createState() => _CardWidgetState(category, productName, retailPrice, wholesalePrice, itemcode, imageURL);
}

class _CardWidgetState extends State<CardWidget> {

	String productName;
	String category;
	String wholesalePrice;
	String retailPrice;
	String itemcode;
	String imageURL;

	_CardWidgetState(this.category, this.productName, this.retailPrice, this.wholesalePrice, this.itemcode, this.imageURL);

	@override
	Widget build(BuildContext context) {
		return Container(
			//decoration: boxBorderDecoration,
			padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
			width: MediaQuery.of(context).size.width / 1.1,
			height: MediaQuery.of(context).size.height / 4.2,
			// margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
			child: Card(
				color: rmqSecondaryColor,
				elevation: 5,
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Flexible(
							flex: 1,
							child: Row(
								children: <Widget>[
									Container(
										//padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0,),
										margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
										width: MediaQuery.of(context).size.width / 4.4,
										height: MediaQuery.of(context).size.height / 3,
										child: FittedBox(
											fit: BoxFit.contain,
											child: Image.network(
												imageURL,
											),
										),
									),
								],
							),
						),
						Flexible(
							flex: 2,
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									Text(
										productName +
											'\n' +
											itemcode.toUpperCase() +
											'\n' +
											category,
										style: TextStyle(fontSize: MediaQuery.of(context).size.width / 16.1),
									),
									Text(
										'Wholesale: ' +
										wholesalePrice + 
										'\nRetail: ' +
										retailPrice,
										style: TextStyle(fontSize: MediaQuery.of(context).size.width / 24),
									)
								],
							),
						),
					],
				),
			),
		);
	}
}