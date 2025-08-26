import 'package:priya_freshmeats_delivery/core/network/network_api_services.dart';
import 'package:priya_freshmeats_delivery/data/models/auth/login_model.dart';
import 'package:priya_freshmeats_delivery/data/models/auth/verifyotp_model.dart';
import 'package:priya_freshmeats_delivery/res/constants/app_urls.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class LoginRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();
  Future<LoginModel> userLogin(String phone) async {
    try {
      final payload = {"phone": phone};

      final response = await _apiServices.postApiResponse(
        AppUrls.loginUrl,
        payload,
      );

      return LoginModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOtpModel> verifyOtp(
    String otp,
    String phone,
    String userId,
  ) async {
    try {
      final payload = {"otp": otp, "phone": phone, "userId": userId};

      final response = await _apiServices.postApiResponse(
        AppUrls.otpUrl,
        payload,
      );
      return VerifyOtpModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in verifyOtp: $e");
      rethrow;
    }
  }
}
