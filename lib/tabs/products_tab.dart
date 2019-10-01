import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return ListView.separated(
              itemBuilder: (context, index){
                return CategoryTile(snapshot.data.documents[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[500],
                  thickness: 1.0,
                );
              },
              itemCount: snapshot.data.documents.length
          );
        }
      },
    );
  }
}
