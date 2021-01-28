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
	String catName;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Theme.of(context).backgroundColor,
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
											child: Container(
												padding: EdgeInsets.all(10.0),
												child: Text('Hardware'),
												decoration: BoxDecoration(
													border: Border.all(
														width: 3.0,
														color: rmqPrimaryColor,
													),
												)
											),
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
											child: Container(
												child: Text('Glassware'),
												padding: EdgeInsets.all(10.0),
												decoration: BoxDecoration(
													border: Border.all(
														width: 3.0,
														color: rmqPrimaryColor,
													),
												)
											),
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
											child: Container(
												child: Text('School Supplies'),
												padding: EdgeInsets.all(10.0),
												decoration: BoxDecoration(
													border: Border.all(
														width: 3.0,
														color: rmqPrimaryColor,
													),
												)
											),
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
											child: Container(
												child: Text('Houseware'),
												padding: EdgeInsets.all(10.0),
												decoration: BoxDecoration(
													border: Border.all(
														width: 3.0,
														color: rmqPrimaryColor,
													),
												)
											),
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
											child: Container(
												child: Text('Plasticware'),
												padding: EdgeInsets.all(10.0),
												decoration: BoxDecoration(
													border: Border.all(
														width: 3.0,
														color: rmqPrimaryColor,
													),
												)
											),
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