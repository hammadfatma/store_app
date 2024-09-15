import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitialState());
  List<ProductModel> products = [];
  List<ProductModel> emitProductsState() {
    emit(ProductsLoadingState());
    _homeRepo.fetchAllProducts().then((products) {
      emit(ProductsSuccessState(products));
      this.products = products;
    }).catchError((error) {
      emit(ProductsErrorState());
    });
    return products;
  }
}
