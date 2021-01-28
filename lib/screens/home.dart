import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rmq/screens/addproductform.dart';
import 'package:rmq/shared/constants.dart';
import 'package:rmq/services/firestoresearch.dart';
// import 'package:rmq/screens/editproductform.dart';
// import 'package:rmq/screens/categories.dart';
import 'package:rmq/widgets/categoriescontainer.dart';

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
									child: CategoriesContainer(categoryName: 'Hardware',),
								),
								Flexible(
									flex: 1,
									child: CategoriesContainer(categoryName: 'Glassware',)
								),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: CategoriesContainer(categoryName: 'School Supplies',)
								),
								Flexible(
									flex: 1,
									child: CategoriesContainer(categoryName: 'Houseware',)
								),
							],
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget> [
								Flexible(
									flex: 1,
									child: CategoriesContainer(categoryName: 'Plasticware',)
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