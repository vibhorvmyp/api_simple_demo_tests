import 'package:api_simple_test_demo/bloc/categories/categories_bloc.dart';
import 'package:api_simple_test_demo/views/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(const CategoriesFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 50,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: ListView.separated(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12,
                            ),
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(category.title),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemCount: state.categories.length),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: MediaQuery.of(context).size.height - 200,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white24,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => const ProductScreen())));
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.shopping_bag),
                              SizedBox(
                                width: 10,
                              ),
                              Text('All Products'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white24,
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.shopping_bag_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Cart'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
