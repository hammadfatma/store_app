import 'package:store_app/features/home/data/apis/api_services.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class HomeRepo {
  final ApiServices _apiServices;
  HomeRepo(this._apiServices);
  Future<List<ProductModel>> fetchAllProducts() async {
    final product = await _apiServices.getAllProducts();
    return product.map((element) => ProductModel.fromJson(element)).toList();
  }
}
