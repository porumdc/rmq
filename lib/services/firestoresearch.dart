import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/screens/editproductform.dart';

class Todo {
	final Map data;

	Todo(this.data);
}

class FirestoreSearch extends StatefulWidget {
	@override
	_FirestoreSearchState createState() => _FirestoreSearchState();
}

class _FirestoreSearchState extends State<FirestoreSearch> {
	String query;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				appBar: AppBar(
					backgroundColor: rmqPrimaryColor,
					leading: IconButton(
						icon: Icon(Icons.arrow_back),
						onPressed: () {
							Navigator.of(context).pop();
						},
					),
					title: Card(
						child: TextField(
							onChanged: (val) {
								setState(() { query = val; });
							},
						),
					),
				),
				body: StreamBuilder<QuerySnapshot>(
						stream: (query != "" && query != null)
								? FirebaseFirestore.instance
										.collection('PriceList')
										.where("name".toString().toLowerCase(), isGreaterThanOrEqualTo: query)
										.snapshots()
								: FirebaseFirestore.instance
										.collection('PriceList')
										.snapshots(),
						builder: (context, snapshot) {
							return (snapshot.connectionState == ConnectionState.waiting)
									? Center(child: CircularProgressIndicator())
									: ListView.builder(
											itemCount: snapshot.data.docs.length,
											itemBuilder: (context, index) {
												DocumentSnapshot data = snapshot.data.docs[index];
												//final Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
												return Center(
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
															decoration: boxBorderDecoration,
															width: MediaQuery.of(context).size.width / 1.1,
															height: MediaQuery.of(context).size.height / 4,
															// margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
															child: Card(
																color: rmqSecondaryColor,
																elevation: 5,
																child: Column(
																	mainAxisSize: MainAxisSize.min,
																	children: <Widget>[
																		Padding(
																			padding: EdgeInsets.only(
																					top: 8.0, bottom: 4.0),
																			child: Row(
																				children: <Widget>[
																					Text(
																						snapshot.data.docs[index]['name'] +
																								'\n' +
																								snapshot.data.docs[index]['itemcode'].toString().toUpperCase() +
																								'\n' +
																								snapshot.data.docs[index]['category'],
																						style: TextStyle(fontSize: 20.0),
																					),
																					Spacer(),
																					Image.network(
																						snapshot.data.docs[index]['imageURL'],
																						width: 100.0,
																						height: 100.0,
																					),
																				],
																			),
																		),
																		Padding(
																				padding: EdgeInsets.only(
																						top: 8.0, bottom: 10.0, left: 10.0),
																				child: Row(
																					mainAxisAlignment:
																							MainAxisAlignment.spaceBetween,
																					//crossAxisAlignment: CrossAxisAlignment.baseline,
																					children: <Widget>[
																						Text('Retail: ' + snapshot.data.docs[index]['retail'],
																								style:
																										TextStyle(fontSize: 15.0)),
																						Spacer(),
																						Text(
																								'Wholesale: ' +
																										snapshot.data.docs[index]['wholesale'],
																								style:
																										TextStyle(fontSize: 15.0)),
																						Spacer(),
																					],
																				))
																	],
																),
															),
														),
													),
												);
											});
						}));
	}
}
