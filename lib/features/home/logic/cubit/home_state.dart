part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ProductsLoadingState extends HomeStates {}

class ProductsSuccessState extends HomeStates {
  final List<ProductModel> products;
  ProductsSuccessState(this.products);
}

class ProductsErrorState extends HomeStates {}
