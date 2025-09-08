import 'package:priya_freshmeats_delivery/data/repository/auth_rep/login_repository.dart';
import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class LoginViewModel with ChangeNotifier {
  final LoginRepository _loginRepository = LoginRepository();
  final SharedPref _sharedpref = SharedPref();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isVerifying = false;
  bool get isVerifying => _isVerifying;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isVerifying(bool value) {
    _isVerifying = value;
    notifyListeners();
  }

  Future<bool> userLogin(BuildContext context, String phone) async {
    isLoading = true;
    try {
      final result = await _loginRepository.userLogin(phone);
      debugPrint("Login response: $result");
      if (result.success == true) {
        final userId = result.data.userId;
        debugPrint(userId);
        await _sharedpref.storeUserId(userId);
        notifyListeners();
        Navigator.pushNamed(context, RoutesName.otpscreen, arguments: phone);
        return true;
      } else {
        debugPrint(result.message);
        return false;
      }
    } catch (e) {
      if (e is AppException) {
        debugPrint(e.userFriendlyMessage);
      } else {
        debugPrint("Response body: $e");
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp, String phone) async {
    isVerifying = true;
    try {
      final userId = await _sharedpref.getUserId();
      debugPrint(userId);
      final result = await _loginRepository.verifyOtp(otp, phone, userId!);
      if (result.success) {
        final userData = result.data;

        await _sharedpref.storeUserData(userData);
        if (context.mounted) {
          ToastMessage.showToast(
            context,
            message: "User Verified Successfully",
            icon: Icon(Icons.check, color: Colors.green),
          );
        }
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.bottomnavbar,
          (route) => false,
        );
      } else {
        debugPrint("Failed to Verify OTP :${result.statusCode}");
      }
    } catch (e) {
      if (e is AppException) {
        debugPrint(e.userFriendlyMessage);
      } else {
        debugPrint("An unexpected error occurred.");
      }
    } finally {
      isVerifying = false;
      notifyListeners();
    }
  }
}
