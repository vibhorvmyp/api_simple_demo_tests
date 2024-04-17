import 'package:api_simple_test_demo/bloc/product/product_bloc.dart';
import 'package:api_simple_test_demo/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        color: Colors.white,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is ProductLoaded) {
              List<ProductModel> productList = state.productList;
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.amber,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        leading: Container(
                            height: 120,
                            width: 50,
                            child: Image.network(
                              productList[index].image.toString(),
                              fit: BoxFit.fill,
                            )),
                        title: Text(
                          productList[index].title.toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
            // return Container();
          },
        ),
      ),
    );
  }
}
