import 'package:rmq/screens/addproductform.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/screens/editproductform.dart';
import 'package:rmq/widgets/cardwidget.dart';

class CategoriesScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		String _passedVar = ModalRoute.of(context).settings.arguments;

		return Scaffold(
			backgroundColor: Color(0xFFDBDBDB),
			appBar: AppBar(
				backgroundColor: rmqPrimaryColor,
				title: Text('$_passedVar'),
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
										child: CardWidget(
											category: snapshot.data.docs[index]['category'],
											imageURL: snapshot.data.docs[index]['imageURL'],
											productName: snapshot.data.docs[index]['name'],
											retailPrice: snapshot.data.docs[index]['retail'],
											wholesalePrice: snapshot.data.docs[index]['wholesale'],
											itemcode: snapshot.data.docs[index]['itemcode'],
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