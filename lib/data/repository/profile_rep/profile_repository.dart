import 'package:priya_freshmeats_delivery/core/network/network_api_services.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/contactus_model.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/delete_account_model.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/documents_status_model.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/profile_details_model.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/update_profile_model.dart';
import 'package:priya_freshmeats_delivery/res/constants/app_urls.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class ProfileRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<DocumentStatusModel> documentStatus() async {
    try {
      final url = AppUrls.documentsStatusUrl;
      final response = await _apiServices.getApiResponse(url);

      return DocumentStatusModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileDetailsModel> fetchProfileDetails() async {
    try {
      final url = AppUrls.profileDetailsUrl;

      final response = await _apiServices.getApiResponse(url);

      return ProfileDetailsModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error fetching profile details: $e");
      rethrow;
    }
  }

  Future<DeleteAccountModel> deleteAccount() async {
    try {
      final url = AppUrls.deleteAccountUrl;

      final response = await _apiServices.deleteApiResponse(url);
      return DeleteAccountModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error fetching profile details: $e");
      rethrow;
    }
  }

  Future<UpdateProfileModel> editProfile(String name) async {
    try {
      final url = AppUrls.editProfileUrl;
      final payload = {"name": name};

      final response = await _apiServices.patchApiResponse(url, payload);
      debugPrint("Edit Profile API Response: $response");

      return UpdateProfileModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error editing profile details: $e");
      rethrow;
    }
  }

  Future<ContactusModel> fetchContactUs() async {
    try {
      final url = AppUrls.contactusUrl;

      final response = await _apiServices.getApiResponse(url);

      return ContactusModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error fetching contact us details: $e");
      rethrow;
    }
  }
}
