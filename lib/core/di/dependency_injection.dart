import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/networking/dio_factory.dart';
import 'package:store_app/features/home/data/apis/api_services.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';


final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
