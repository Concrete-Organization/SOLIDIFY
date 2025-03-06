import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts_cubit.dart';
import 'package:solidify/features/marketplace/data/repo/products_list_repo.dart';
import 'package:solidify/features/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/otp/logic/verify_otp_cubit.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/otp/data/repos/verify_otp_repo.dart';
import 'package:solidify/features/chatbot/logic/chatbot_cubit.dart';
import 'package:solidify/features/chatbot/data/api/chatbot_api_call.dart';
import '../../features/auth/reset_password/logic/reset_password_cubit.dart';
import '../../features/auth/forget_password/logic/forget_password_cubit.dart';
import '../../features/auth/reset_password/data/repos/reset_password_repo.dart';
import '../../features/auth/forget_password/data/repos/forget_password_repo.dart';
import 'package:solidify/features/chatbot/data/repos/chatbot_with_gemini_repo.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/data/repo/concrete_strength_ai_repo.dart';
import 'package:solidify/features/concrete_strength_ai/data/api/concrete_strength_ai_api_call.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/repos/engineer_account_sign_up_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/repos/concrete_company_account_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.publicDio;
  Dio authDio = DioFactory.authenticatedDio;

  getIt.registerLazySingleton<ApiService>(() => ApiService(authDio));
  getIt.registerLazySingleton<ChatbotApiService>(() => ChatbotApiService(dio));
  getIt.registerLazySingleton<ConcreteStrengthAiApiCall>(
      () => ConcreteStrengthAiApiCall(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //engineer sign up
  getIt.registerLazySingleton<EngineerAccountSignUpRepo>(
      () => EngineerAccountSignUpRepo(getIt()));
  getIt.registerFactory<EngineerAccountSignUpCubit>(
      () => EngineerAccountSignUpCubit(getIt()));
  //concrete Company account sign up
  getIt.registerLazySingleton<ConcreteCompanyAccountRepo>(
      () => ConcreteCompanyAccountRepo(getIt()));
  getIt.registerFactory<ConcreteCompanySignUpCubit>(
      () => ConcreteCompanySignUpCubit(getIt()));
  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  // verify otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));
  // reset password
  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  // concrete strength ai
  getIt.registerLazySingleton<ConcreteStrengthAiRepo>(
      () => ConcreteStrengthAiRepo(getIt()));
  getIt.registerFactory<ConcreteStrengthAiCubit>(
      () => ConcreteStrengthAiCubit(getIt()));
  //chatbot
  getIt.registerLazySingleton<ChatbotWithGeminiRepo>(() => ChatbotWithGeminiRepo(getIt()));
  getIt.registerFactory<ChatbotCubit>(() => ChatbotCubit(getIt()));
  // products list
  getIt.registerLazySingleton<ProductsListRepo>(() => ProductsListRepo(getIt()));
  getIt.registerFactory<ProductsListCubit>(() => ProductsListCubit(getIt()));
  // posts
  getIt.registerLazySingleton<PostsRepo>(() => PostsRepo(getIt()));
  getIt.registerFactory<PostsCubit>(() => PostsCubit(getIt()));

}
