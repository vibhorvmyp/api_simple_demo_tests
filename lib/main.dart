import 'package:api_simple_test_demo/bloc/categories/categories_bloc.dart';
import 'package:api_simple_test_demo/bloc/product/product_bloc.dart';
import 'package:api_simple_test_demo/repo/categories/categories_repo.dart';
import 'package:api_simple_test_demo/repo/product/product_repo.dart';
import 'package:api_simple_test_demo/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(httpClient: http.Client()),
        ),
        RepositoryProvider(
          create: (context) => CategoriesRepository(httpClient: http.Client()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProductBloc(RepositoryProvider.of<ProductRepository>(context)),
          ),
          BlocProvider(
            create: (context) => CategoriesBloc(
                categoriesRepository:
                    RepositoryProvider.of<CategoriesRepository>(context)),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bloc API Wishlist',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen()),
      ),
    );
  }
}
