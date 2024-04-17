import 'package:api_simple_test_demo/bloc/product/product_bloc.dart';
import 'package:api_simple_test_demo/repo/product/product_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  ProductBloc(ProductRepository(httpClient: http.Client()));
}
