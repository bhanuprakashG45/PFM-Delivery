import 'package:priya_freshmeats_delivery/data/models/auth/verifyotp_model.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? _prefs;

  Future<void> _initSharedPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> storelastQuestionShownTime() async {
    await _initSharedPreferences();
    await _prefs!.setString('lastshowntime', DateTime.now().toIso8601String());
  }

  Future<bool> isAvailableQuestions() async {
    await _initSharedPreferences();
    String? encodedData = _prefs!.getString('popupQuestions');

    if (encodedData == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> storeAccessToken(String? accessToken) async {
    await _initSharedPreferences();
    debugPrint("AccessToken : $accessToken");
    if (accessToken != null) {
      await _prefs!.setString('accessToken', accessToken);
    }
  }

  Future<void> storeRefreshToken(String? refreshToken) async {
    await _initSharedPreferences();
    if (refreshToken != null) {
      await _prefs!.setString('refreshToken', refreshToken);
    }
  }

  Future<void> storeUserId(String userId) async {
    await _initSharedPreferences();
    await _prefs!.remove('userId');
    await _prefs!.setString('userId', userId);
  }

  Future<void> storeUserData(UserData userData) async {
    await _initSharedPreferences();
    String accessToken = userData.accessToken;
    String refreshToken = userData.refreshToken;
    String userId = userData.user.id;
    await storeAccessToken(accessToken);
    await storeRefreshToken(refreshToken);
    await storeUserId(userId);
    debugPrint(accessToken);
    debugPrint(refreshToken);
  }

  Future<String?> getlastQuestionShownTime() async {
    await _initSharedPreferences();
    return _prefs!.getString('lastshowntime');
  }

  Future<String?> getUserData() async {
    await _initSharedPreferences();
    return _prefs!.getString('userData');
  }

  Future<String?> getUserId() async {
    await _initSharedPreferences();
    return _prefs!.getString('userId');
  }

  Future<String?> getAccessToken() async {
    await _initSharedPreferences();
    return _prefs!.getString('accessToken') ?? null;
  }

  Future<String> getRefreshToken() async {
    await _initSharedPreferences();
    return _prefs!.getString('refreshToken') ?? '';
  }

  Future<void> clearAccessToken() async {
    await _initSharedPreferences();
    if (_prefs!.containsKey('accessToken')) {
      await _prefs!.remove('accessToken');
    }
  }

  Future<void> clearRefreshToken() async {
    await _initSharedPreferences();
    if (_prefs!.containsKey('refreshToken')) {
      await _prefs!.remove('refreshToken');
    }
  }

  Future<void> clearUserData() async {
    await _initSharedPreferences();
    if (_prefs!.containsKey('userData')) {
      await _prefs!.remove('userData');
    }
    await _prefs!.clear();
  }

  Future<void> storeModalIndex(int index) async {
    await _initSharedPreferences();
    await _prefs!.setInt("modalindex", index);
  }

  Future<int?> getModalIndex() async {
    await _initSharedPreferences();
    return _prefs!.getInt('modalindex');
  }
}
