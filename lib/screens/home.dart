import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rmq/screens/addproductform.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/services/firestoresearch.dart';
// import 'package:rmq/screens/editproductform.dart';
import 'package:rmq/screens/categories.dart';

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
	String catName;

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
						onPressed:() async {
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
			body: SingleChildScrollView(
				child: Column(
					children: <Widget> [
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () async {
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => CategoriesScreen(),
														settings: RouteSettings(
															arguments: catName = 'Hardware',
														),
													),
												);
											},
											child: Text('Hardware'),
										),
									),
								),
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () async {
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => CategoriesScreen(),
														settings: RouteSettings(
															arguments: catName = 'Glassware',
														),
													),
												);
											},
											child: Text('Glassware'),
										),
									),
								),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () async {
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => CategoriesScreen(),
														settings: RouteSettings(
															arguments: catName = 'School Supplies',
														),
													),
												);
											},
											child: Text('School Supplies'),
										),
									),
								),
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () async {
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => CategoriesScreen(),
														settings: RouteSettings(
															arguments: catName = 'Houseware',
														),
													),
												);
											},
											child: Text('Houseware'),
										),
									),
								),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () async {
												Navigator.push(
													context, MaterialPageRoute(
														builder: (context) => CategoriesScreen(),
														settings: RouteSettings(
															arguments: catName = 'Plasticware',
														),
													),
												);
											},
											child: Text('Plasticware'),
										),
									),
								),
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () {},
											child: Text('Empty'),
										),
									),
								),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () {},
											child: Text('Empty'),
										),
									),
								),
								Flexible(
									flex: 1,
									child: Container(
										width: MediaQuery.of(context).size.width / 2,
										height: MediaQuery.of(context).size.width / 2,
										child: FlatButton(
											onPressed: () {},
											child: Text('Empty'),
										),
									),
								),
							],
						),
					],
				),
			),
		);
	}
}