import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/repos/user_sign_up_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//user sign up
  getIt.registerLazySingleton<UserSignUpRepo>(() => UserSignUpRepo(getIt()));
  getIt.registerFactory<UserSignUpCubit>(() => UserSignUpCubit(getIt()));
}
