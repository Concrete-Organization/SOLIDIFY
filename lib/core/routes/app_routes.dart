import 'package:flutter/material.dart';
import '../di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/shared_screens/help_screen.dart';
import 'package:solidify/features/auth/otp/ui/otp_screen.dart';
import 'package:solidify/core/shared_screens/about_screen.dart';
import 'package:solidify/features/auth/login/ui/login_screen.dart';
import 'package:solidify/features/chatbot/logic/chatbot_cubit.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/onboarding/onboarding_screen.dart';
import 'package:solidify/core/shared_screens/account_type_screen.dart';
import 'package:solidify/features/chatbot/ui/screens/chat_screen.dart';
import 'package:solidify/core/shared_screens/notifications_screen.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:solidify/features/marketplace/cart/ui/cart_screen.dart';
import 'package:solidify/core/shared_screens/privacy_policy_screen.dart';
import 'package:solidify/features/app_flows_layouts/company_layout.dart';
import 'package:solidify/features/app_flows_layouts/engineer_layout.dart';
import 'package:solidify/features/community/logic/posts/posts_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/core/shared_screens/about_your_account_screen.dart';
import 'package:solidify/features/marketplace/search/logic/search_cubit.dart';
import 'package:solidify/features/marketplace/search/screens/search_screen.dart';
import 'package:solidify/features/marketplace/favorites/ui/favorites_screen.dart';
import 'package:solidify/features/marketplace/order/ui/screens/payment_screen.dart';
import 'package:solidify/features/marketplace/order/ui/screens/checkout_screen.dart';
import 'package:solidify/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:solidify/features/profile_company/ui/screens/orders_list_screen.dart';
import 'package:solidify/features/community/ui/screens/posts/create_post_screen.dart';
import 'package:solidify/features/marketplace/order/ui/screens/order_done_screen.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:solidify/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_cubit.dart';
import 'package:solidify/features/profile_company/ui/screens/order_details_screen.dart';
import 'package:solidify/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_upload_files_screen.dart';
import 'package:solidify/features/marketplace/marketplace/ui/screens/reviews_screen.dart';
import 'package:solidify/features/marketplace/order/ui/screens/address_details_screen.dart';
import 'package:solidify/features/marketplace/search/screens/search_with_filter_screen.dart';
import 'package:solidify/features/crack_detection/ui/screens/upload_crack_gallery_image.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/ui/screens/write_review_screen.dart';
import 'package:solidify/features/marketplace/marketplace/ui/screens/best_sellers_screen.dart';
import 'package:solidify/features/crack_detection/ui/screens/crack_detection_result_screen.dart';
import 'package:solidify/features/profile_company/logic/post_review_cubit/post_review_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/ui/screens/product_details_screen.dart';
import '../../features/concrete_strength_ai/ui/screens/concrete_strength_ai_questions_screen.dart';
import 'package:solidify/features/marketplace/marketplace/ui/screens/product_category_screen.dart';
import 'package:solidify/features/concrete_strength_ai/ui/screens/concrete_strength_ai_result.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit/order_details_cubit.dart';
import 'package:solidify/features/crack_detection/ui/screens/crack_detection_choose_uploading_image.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';
import 'package:solidify/features/marketplace/order/logic/shipping_address_cubit/shipping_address_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/select_account_type/ui/select_account_type_screen.dart';
import '../../features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/ui/engineer_account_sign_up_screen.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_category_cubit.dart/product_category_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/concrete_company_sign_up_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.selectAccountTypeScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectAccountTypeScreen(),
        );
      case Routes.engineerSignUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EngineerAccountSignUpCubit>(),
            child: const EngineerAccountSignUpScreen(),
          ),
        );
      case Routes.signUpUploadFilesScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpUploadFilesScreen(),
        );
      case Routes.concreteCompanyAccountScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ConcreteCompanySignUpCubit>(),
            child: const ConcreteCompanySignUpScreen(),
          ),
        );
      case Routes.companyLayout:
        return MaterialPageRoute(
          builder: (context) => const CompanyLayout(),
        );
      case Routes.engineerLayout:
        return MaterialPageRoute(
          builder: (context) => const EngineerLayout(),
        );
      case Routes.concreteStrengthScreens:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ConcreteStrengthAiCubit>(),
            child: const ConcreteStrengthAiQuestionsScreen(),
          ),
        );
      case Routes.concreteStrengthAiResultScreen:
        return MaterialPageRoute(
          builder: (context) => const ConcreteStrengthAiResult(),
        );
      case Routes.productCategoryScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductCategoryCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: const ProductCategoryScreen(),
          ),
          settings: settings,
        );

      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductDetailsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: const ProductDetailsScreen(),
          ),
          settings: settings,
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ChatbotCubit>(),
            child: const ChatScreen(),
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: const CartScreen(),
          ),
        );
      case Routes.createPostScreen:
        final postsCubit = settings.arguments as PostsCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: postsCubit,
            child: CreatePostScreen(),
          ),
        );
      case Routes.addressDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ShippingAddressCubit>(),
            child: const ShippingAddressScreen(),
          ),
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrderCubit>(),
            child: const PaymentScreen(),
          ),
        );
      case Routes.orderDoneScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderDoneScreen(),
        );
      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: const FavoritesScreen(),
          ),
        );
      case Routes.bestSellersScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsListCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: const BestSellersScreen(),
          ),
        );
      case Routes.crackDetectionChooseUploadingImageScreen:
        return MaterialPageRoute(
          builder: (context) => const CrackDetectionChooseUploadingImage(),
        );
      case Routes.uploadCrackGalleryImageScreen:
        return MaterialPageRoute(
          builder: (context) => const UploadCrackGalleryImage(),
        );
      case Routes.crackDetectionResultScreen:
        return MaterialPageRoute(
          builder: (context) => const CrackDetectionResultScreen(),
        );
      case Routes.reviewsScreen:
        final List<ReviewModel> reviews =
            settings.arguments as List<ReviewModel>;
        return MaterialPageRoute(
          builder: (context) => ReviewsScreen(reviews: reviews),
        );
      case Routes.ordersListScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrderCubit>(),
            child: const OrdersListScreen(),
          ),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
        );
      case Routes.orderDetailsScreen:
        final orderId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<OrderCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<OrderDetailsCubit>(),
              ),
            ],
            child: OrderDetailsScreen(orderId: orderId ?? ''),
          ),
        );
      case Routes.aboutScreen:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsListCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: const SearchScreen(),
          ),
        );
      case Routes.searchWithFilterScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SearchCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: const SearchWithFilterScreen(),
          ),
        );
      case Routes.helpScreen:
        return MaterialPageRoute(
          builder: (context) => const HelpScreen(),
        );
      case Routes.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case Routes.aboutYourAccountScreen:
        return MaterialPageRoute(
          builder: (context) => const AboutYourAccountScreen(),
        );
      case Routes.accountTypeScreen:
        return MaterialPageRoute(
          builder: (context) => const AccountTypeScreen(),
        );
      case Routes.writeReviewScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final productId = args?['productId'] as String?;
        final imageUri = args?['imageUri'] as String?;
        final name = args?['name'] as String?;
        final price = args?['price'] as String?;
        if (productId == null || imageUri == null || name == null || price == null) {
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text('Missing required arguments')),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PostReviewCubit>(),
            child: WriteReviewScreen(
              productId: productId,
              imageUri: imageUri,
              name: name,
              price: price,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
