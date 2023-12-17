// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/config/di.dart';
import 'package:flutter_demo/model/product_model.dart';
import 'package:flutter_demo/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(),
                    ));
              },
              icon: Icon(Icons.next_plan))
        ],
      ),
      body: FutureBuilder(
          future: ProductsServiceImp().getAllProduct(),
          builder: (context, status) {
            if (status.hasData) {
              dynamic temp = status.data;
              List<ProductModel> search_result = [];
              List<ProductModel> produts = List.generate(
                  temp['products'].length,
                  (index) => ProductModel.fromMap(temp['products'][index]));
              return searchScaffold(
                  produts: produts, search_result: search_result);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class searchScaffold extends StatefulWidget {
  const searchScaffold({
    super.key,
    required this.produts,
    required this.search_result,
  });

  final List<ProductModel> produts;
  final List<ProductModel> search_result;

  @override
  State<searchScaffold> createState() => _searchScaffoldState();
}

class _searchScaffoldState extends State<searchScaffold> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            config.get<SharedPreferences>().setString('searched', value);
            print(value);
            setState(() {
              widget.search_result.clear();
              widget.produts.forEach((element) {
                if (element.title.contains(value)) {
                  widget.search_result.add(element);
                }
              });
            });
          },
        ),
        SizedBox(
          height: 600,
          child: ListView.builder(
            itemCount: widget.search_result.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productModel: widget.search_result[index]),));
                },
                title: Text(widget.search_result[index].title),
                leading: Hero(
                  tag: widget.search_result[index].id,
                  child: Image.network(widget.search_result[index].thumbnail)),
              );
            },
          ),
        )
      ],
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Your Result History'),
      ),
      body: ListTile(
        title: Text(
            config.get<SharedPreferences>().getString('searched') ?? 'Nothing'),
      ),
    );
  }
}



class ProductDetails extends StatelessWidget {
   ProductDetails({super.key, required this.productModel});
  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: productModel.id,
            child: Image.network(productModel.thumbnail)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(title: Text(productModel.title),
            subtitle: Text(productModel.price.toString()),
            ),
          )
        ],
      ),
    );
  }
}