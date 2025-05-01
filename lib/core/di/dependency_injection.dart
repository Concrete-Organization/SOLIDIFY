import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/dio_factory.dart';
import 'package:solidify/features/auth/forget_password/data/repos/forget_password_repo.dart';
import 'package:solidify/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:solidify/features/auth/login/data/repo/login_repo.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/auth/otp/data/repos/verify_otp_repo.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:solidify/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:solidify/features/chatbot/logic/chatbot_cubit.dart';
import 'package:solidify/features/community/data/repos/posts_repo.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/chatbot/data/api/chatbot_api_call.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/community/data/repos/comments_repo.dart';
import 'package:solidify/features/marketplace/search/logic/search_cubit.dart';
import 'package:solidify/features/marketplace/cart/data/repos/cart_repo.dart';
import 'package:solidify/features/profile_company/data/repos/reviews_repo.dart';
import 'package:solidify/features/marketplace/order/data/repos/order_repo.dart';
import 'package:solidify/features/community/logic/comments/comments_cubit.dart';
import 'package:solidify/features/marketplace/search/data/repos/search_repo.dart';
import 'package:solidify/features/chatbot/data/repos/chatbot_with_gemini_repo.dart';
import 'package:solidify/features/profile_company/data/repos/order_details_repo.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_cubit.dart';
import 'package:solidify/features/profile_engineer/data/repo/engineer_profile_repo.dart';
import 'package:solidify/features/marketplace/order/data/repos/shipping_address_repo.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/data/repos/products_list_repo.dart';
import 'package:solidify/features/marketplace/marketplace/data/repos/product_details_repo.dart';
import 'package:solidify/features/concrete_strength_ai/data/repo/concrete_strength_ai_repo.dart';
import 'package:solidify/features/marketplace/marketplace/data/repos/product_category_repo.dart';
import 'package:solidify/features/profile_company/logic/post_review_cubit/post_review_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/data/api/concrete_strength_ai_api_call.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit/order_details_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_cubit.dart';
import 'package:solidify/features/marketplace/order/logic/shipping_address_cubit/shipping_address_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_posts/profile_engineer_posts_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_category_cubit.dart/product_category_cubit.dart';
import 'package:solidify/features/profile_engineer/logic/profile_engineer_comments/profile_engineer_comments_cubit.dart';
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
  getIt.registerLazySingleton<ChatbotWithGeminiRepo>(
      () => ChatbotWithGeminiRepo(getIt()));
  getIt.registerFactory<ChatbotCubit>(() => ChatbotCubit(getIt()));
  // products list
  getIt
      .registerLazySingleton<ProductsListRepo>(() => ProductsListRepo(getIt()));
  getIt.registerFactory<ProductsListCubit>(() => ProductsListCubit(getIt()));
  // posts
  getIt.registerLazySingleton<PostsRepo>(() => PostsRepo(getIt()));
  getIt.registerFactory<PostsCubit>(() => PostsCubit(getIt()));
  //comment
  getIt.registerLazySingleton<CommentsRepo>(() => CommentsRepo(getIt()));
  getIt.registerFactory<CommentsCubit>(() => CommentsCubit(getIt()));
  // product by  category
  getIt.registerLazySingleton<ProductCategoryRepo>(
      () => ProductCategoryRepo(getIt()));
  getIt.registerFactory<ProductCategoryCubit>(
      () => ProductCategoryCubit(getIt()));
  // cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  // product details
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()));
  getIt
      .registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()));
  // engineer profile
  getIt.registerLazySingleton<EngineerProfileRepo>(
      () => EngineerProfileRepo(getIt()));
  getIt.registerFactory<EngineerProfileCubit>(
      () => EngineerProfileCubit(getIt()));
  getIt.registerFactory<ProfileEngineerPostsCubit>(
      () => ProfileEngineerPostsCubit(getIt<PostsRepo>()));
  getIt.registerFactory<ProfileEngineerCommentsCubit>(() =>
      ProfileEngineerCommentsCubit(getIt<PostsRepo>(), getIt<CommentsRepo>()));
  // shipping address
  getIt.registerLazySingleton<ShippingAddressRepo>(
      () => ShippingAddressRepo(getIt()));
  getIt.registerFactory<ShippingAddressCubit>(
      () => ShippingAddressCubit(getIt()));
  // search
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  // order
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerFactory<OrderCubit>(() => OrderCubit(getIt()));
  // order details
  getIt
      .registerLazySingleton<OrderDetailsRepo>(() => OrderDetailsRepo(getIt()));
  getIt.registerFactory<OrderDetailsCubit>(() => OrderDetailsCubit(getIt()));
// review
  getIt.registerLazySingleton<ReviewsRepo>(() => ReviewsRepo(getIt()));
  getIt.registerLazySingleton<PostReviewCubit>(
      () => PostReviewCubit(getIt<ReviewsRepo>()));
}
