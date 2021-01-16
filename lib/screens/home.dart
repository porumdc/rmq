import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rmq/screens/addproductform.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/services/firestoresearch.dart';
//import 'package:rmq/screens/editproductform.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	// void _addNewProduct() {
	// 	showModalBottomSheet<dynamic>(
	// 		context: context,
	// 		isScrollControlled: true,
	// 		enableDrag: false,
		
	// 		builder: (BuildContext context) {
	// 			return Scaffold(
	// 				body: Padding(
	// 					padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
	// 					child: Column(
	// 						children: <Widget>[
	// 							GestureDetector(
	// 								behavior: HitTestBehavior.opaque,
	// 								onTap: () {},
	// 								child: AddProductForm(),
	// 							)
	// 						],
	// 					),
	// 				),
	// 			);
	// 		},
	// 	);
	// }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.grey[100],
			appBar: AppBar(
				title: Text('Price List'),
				backgroundColor: rmqPrimaryColor,
				actions: <Widget>[
					FlatButton.icon(
						icon: Icon(Icons.search),
						label: Text(''),
						onPressed:() {
							Navigator.push(context, MaterialPageRoute(builder: (context) => FirestoreSearch()),);
						},
					),
					FlatButton.icon(
						icon: Icon(Icons.add),
						label: Text(''),
						onPressed: () {
							Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductForm()),);
						},
					),
					
				],
			),
			body: StreamBuilder(
				stream: FirebaseFirestore.instance.collection('PriceList').snapshots(),
				builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
					if (!snapshot.hasData) {
						return Center(
							child: CircularProgressIndicator(),
						);
					} else {
						return Center(child: Text('Hello world'));
					}
				},
			),
		);
	}
}
