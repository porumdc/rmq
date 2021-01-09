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
						return Container();
						// return ListView(
						// 	children: snapshot.data.docs.map((document) {
						// 		return Center(
						// 			child: GestureDetector(
						// 				onTap: () {},
						// 				child: Container(
						// 					decoration: boxBorderDecoration,
						// 					width: MediaQuery.of(context).size.width / 1.1,
						// 					height: MediaQuery.of(context).size.height / 4,
						// 					// margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
						// 					child: Card(
						// 						color: rmqSecondaryColor,
						// 						elevation: 5,
						// 						child: Column(
						// 							mainAxisSize: MainAxisSize.min,

						// 							children: <Widget>[

						// 								Padding(
						// 									padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
						// 									child: Row(
						// 										children: <Widget>[
						// 											Text(document['name'] + '\n'+ document['itemcode'] + '\n' + document['category'], 
						// 												style: TextStyle(
						// 													fontSize: 20.0
						// 												),
						// 											),
																	
						// 											Spacer(),
						// 											Image.network(document['imageURL'], width: 100.0, height: 100.0,),
						// 										],
						// 									),
						// 								),

						// 								Padding(
						// 									padding: EdgeInsets.only(top: 8.0, bottom: 10.0, left: 10.0),
						// 									child: Row(
						// 										mainAxisAlignment: MainAxisAlignment.spaceBetween,
						// 										crossAxisAlignment: CrossAxisAlignment.baseline,
						// 										children: <Widget> [
						// 											Text('Retail: ' + document['retail'], style: TextStyle(fontSize: 15.0)),
						// 											Spacer(),
						// 											Text('Wholesale: ' + document['wholesale'], style: TextStyle(fontSize: 15.0)),
						// 											Spacer(),
																	
						// 										],
						// 									)
						// 								)
						// 							],
						// 						),
						// 					),
						// 				),
						// 			),
						// 		);
						// 	}).toList(),
						// );
					}
				},
			),
		);
	}
}
