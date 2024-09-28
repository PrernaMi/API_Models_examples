import 'dart:convert';

import 'package:api_examples/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/post_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Post's raw data")),
        ),
        body: FutureBuilder<ProductDataModel?>(
            future: getProduct(),
            builder: (_, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapShot.hasError) {
                return Center(child: Text(snapShot.error.toString()));
              } else if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data!.products!.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Image.network(snapShot.data!.products![index].images![0]),
                        ),
                        title: Text(snapShot.data!.products![index].title!),
                        subtitle: Text(snapShot.data!.products![index].description!),
                      );
                    });
              }
              return Container();
            }));
  }

  // Future<PostData?> getQuotes() async {
  //   // String url = "https://dummyjson.com/quotes";
  //   String url = "https://dummyjson.com/posts";
  //   Uri uri = Uri.parse(url);
  //   http.Response response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var resData = jsonDecode(response.body);
  //     return PostData.fromJson(resData);
  //   } else {
  //     return null;
  //   }
  // }

  Future<ProductDataModel?> getProduct() async {
    String url = "https://dummyjson.com/products";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      var resData = jsonDecode(res.body);
      return ProductDataModel.fromJson(resData);
    }else{
      return null;
    }
  }
}