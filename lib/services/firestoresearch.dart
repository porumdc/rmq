import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/screens/editproductform.dart';
import 'package:rmq/widgets/cardwidget.dart';

class FirestoreSearch extends StatefulWidget {
	@override
	_FirestoreSearchState createState() => _FirestoreSearchState();
}

class _FirestoreSearchState extends State<FirestoreSearch> {
	String query = "";
	String plusz;

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
						onChanged: (String val) {
							setState(() {
								query = val;
								plusz = query + 'z';
							},);
						},
					),
				),
			),
			body: StreamBuilder<QuerySnapshot>(
				stream: (query != "" && query != null)
					? FirebaseFirestore.instance.collection('PriceList')
						.where('name', isGreaterThanOrEqualTo: query)
						.where('name', isLessThan: plusz)
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
									child: CardWidget(
										productName: snapshot.data.docs[index]['name'],
										imageURL: snapshot.data.docs[index]['imageURL'],
										itemcode: snapshot.data.docs[index]['itemcode'],
										wholesalePrice: snapshot.data.docs[index]['wholesale'],
										retailPrice: snapshot.data.docs[index]['retail'],
										category: snapshot.data.docs[index]['category'],
									)
								),
							);
						}
					);
				}
			)
		);
	}
}
