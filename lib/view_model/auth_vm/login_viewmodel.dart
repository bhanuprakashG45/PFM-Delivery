import 'package:priya_freshmeats_delivery/utils/exports.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isVerifying = false;
  bool get isVerifying => _isVerifying;

  String? errorMessage;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isVerifying(bool value) {
    _isVerifying = value;
    notifyListeners();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
