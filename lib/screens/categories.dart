import 'package:rmq/screens/addproductform.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/screens/editproductform.dart';

class CategoriesScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		String _passedVar = ModalRoute.of(context).settings.arguments;

		return Scaffold(
			backgroundColor: Color(0xFFDBDBDB),
			appBar: AppBar(
				backgroundColor: rmqPrimaryColor,
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.add),
						onPressed: () async {
							Navigator.push(
								context,
								MaterialPageRoute(
									builder: (context) => AddProductForm(),
								)
							);
						},
					)
				]
			),
			body: StreamBuilder<QuerySnapshot>(
				stream: FirebaseFirestore.instance.collection('PriceList').where('category', isEqualTo: _passedVar).snapshots(),
				builder: (context, snapshot){
					return (snapshot.connectionState == ConnectionState.waiting)
						? Center(child: CircularProgressIndicator())
						: ListView.builder(
							itemCount: snapshot.data.docs.length,
							itemBuilder: (context, index) {
								DocumentSnapshot data = snapshot.data.docs[index];
								return (snapshot.data.docs.length == 0)
								? Center(child: Text('Empty :c'))
								: Center(
									child: GestureDetector(
										onTap: () async {
											Navigator.push(
												context,
												MaterialPageRoute(
													builder: (context) => EditProductForm(),
													settings: RouteSettings(
														arguments: data,
													),
												),
											);
										},
										child: Container(
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
																				snapshot.data.docs[index]['imageURL'],
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
																		snapshot.data.docs[index]['name'] +
																		'\n' +
																		snapshot.data.docs[index]['itemcode'].toString().toUpperCase() +
																		'\n' +
																		snapshot.data.docs[index]['category'],
																		style: TextStyle(fontSize: MediaQuery.of(context).size.width / 16.1),
																	),
																	Text(
																		'Wholesale: ' +
																		snapshot.data.docs[index]['wholesale'] + 
																		'\nRetail: ' +
																		snapshot.data.docs[index]['retail'],
																		style: TextStyle(fontSize: MediaQuery.of(context).size.width / 24),
																	)
																],
															),
														),
													],
												),
											),
										),
									),
								);
							}
						);
				}
			)
		);
	}
}