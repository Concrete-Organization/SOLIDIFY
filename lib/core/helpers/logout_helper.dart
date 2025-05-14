import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/main.dart';

class LogoutHelper {
  static Future<void> logout() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
    await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, false);

    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginScreen,
          (route) => false,
    );
  }
}