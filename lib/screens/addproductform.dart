import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:rmq/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductForm extends StatefulWidget {
	@override
	_AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
	final _formKey = GlobalKey<FormState>();
	final databaseReference = FirebaseFirestore.instance;

	String _productName;
	String _retailPrice;
	String _wholesalePrice;
	String _category;
	String loading = 'Choose image';
	String imageURL;
	bool isLoading = false;
	String error = '';
	String _itemcode;

	void uploadImage() async {
		final _storage = FirebaseStorage.instance;
		final _picker = ImagePicker();
		PickedFile image;

		await Permission.photos.request();
		var permissionStatus = await Permission.photos.status;
		if (permissionStatus.isGranted) {
			image = await _picker.getImage(source: ImageSource.gallery);
			var file = File(image.path);
			if (image != null) {
			var snapshot =
				await _storage.ref().child(DateTime.now().toString()).putFile(file);
			var downloadURL = await snapshot.ref.getDownloadURL();

			setState(() {
				imageURL = downloadURL;
			});
			} else {
			print('No Path Received');
			}
		} else {
			print('Denied');
		}
	}

	void addProduct() async {
		await databaseReference.collection("PriceList").doc(_productName).set({
			'retail': _retailPrice,
			'wholesale': _wholesalePrice,
			'category': _category,
			'name': _productName,
			'imageURL': imageURL,
			'itemcode': _itemcode,
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.grey[200],
			body: StreamBuilder(
				stream: FirebaseFirestore.instance.collection('PriceList').snapshots(),
				builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
					return Padding(
						padding: const EdgeInsets.only(right: 40.0, left: 40.0),
						child: Form(
							key: _formKey,
							child: Column(
								children: <Widget>[
									SizedBox(height: 20.0),
									TextFormField(
										decoration: textInputDecoration.copyWith(
											hintText: 'Product Name', labelText: 'Product Name'),
										validator: (val) =>
											val.isEmpty ? 'Please enter product name' : null,
										onChanged: (val) => setState(() => _productName = val),
									),
									SizedBox(height: 15.0),
									TextFormField(
										decoration: textInputDecoration.copyWith(
											hintText: 'Item Code', labelText: 'Item Code'),
										validator: (val) =>
											val.isEmpty ? 'Please enter Item code' : null,
										onChanged: (val) => setState(() => _itemcode = val),
									),
									SizedBox(height: 15.0),
									TextFormField(
										decoration: textInputDecoration.copyWith(
											hintText: 'Wholesale Price',
											labelText: 'Wholesale Price'),
										inputFormatters: [
										FilteringTextInputFormatter.allow(
											RegExp(r'^\d+\.?\d{0,2}')),
										],
										keyboardType:
											TextInputType.numberWithOptions(decimal: true),
										validator: (val) =>
											val.isEmpty ? 'Please enter wholesale price' : null,
										onChanged: (val) => setState(() => _wholesalePrice = val),
									),
									SizedBox(height: 15.0),
									TextFormField(
										inputFormatters: [
											FilteringTextInputFormatter.allow(
											RegExp(r'^\d+\.?\d{0,2}')),
										],
										keyboardType:
											TextInputType.numberWithOptions(decimal: true),
										decoration: textInputDecoration.copyWith(
											hintText: 'Retail Price', labelText: 'Retail Price'),
										validator: (val) =>
											val.isEmpty ? 'Please enter retail price' : null,
										onChanged: (val) => setState(() => _retailPrice = val),
									),
									SizedBox(height: 15.0),
									TextFormField(
										decoration: textInputDecoration.copyWith(
											hintText: 'Category', labelText: 'Category'),
										validator: (val) => val.isEmpty
											? 'Please enter product\'s category'
											: null,
										onChanged: (val) => setState(() => _category = val),
									),
									SizedBox(height: 20.0),
									RaisedButton(
										color: rmqPrimaryColor,
										padding: EdgeInsets.symmetric(
											vertical: 15.0, horizontal: 100.0),
										child: Text(
										'Choose image to upload',
										style: TextStyle(color: Colors.white, fontSize: 15.0),
										),
										onPressed: () async {
										try {
											if (_formKey.currentState.validate()) {
											uploadImage();
											}
										} catch (e) {
											setState(() {
											setState(() => error = e.toString());
											});
										}
										},
									),
									SizedBox(height: 20.0),
									RaisedButton(
										color: rmqPrimaryColor,
										padding: EdgeInsets.symmetric(
											vertical: 15.0, horizontal: 100.0),
										child: Text(
										'Done',
										style: TextStyle(color: Colors.white, fontSize: 15.0),
										),
										onPressed: () async {
										try {
											if (_formKey.currentState.validate() &&
												imageURL != null) {
											addProduct();
											Navigator.pop(context);
											} else {
											setState(() {
												setState(() => error = "Add an image");
											});
											}
										} catch (e) {
											setState(() {
											setState(() => error = e.toString());
											});
										}
										},
									),
									SizedBox(height: 20.0),
									Text(
										error,
										style: TextStyle(color: rmqPrimaryColor, fontSize: 14.0),
									),
								],
							),
						),
					);
				},
			),
		);
	}
}
