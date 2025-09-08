import 'package:priya_freshmeats_delivery/data/models/profile/documents_status_model.dart';
import 'package:priya_freshmeats_delivery/data/models/profile/profile_details_model.dart';
import 'package:priya_freshmeats_delivery/data/repository/profile_rep/profile_repository.dart';
import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class ProfileViewmodel with ChangeNotifier {
  final ProfileRepository _repository = ProfileRepository();

  ProfileData _profileData = ProfileData(
    documentStatus: DocumentStatus(
      idProof: '',
      addressProof: '',
      vehicleDocuments: '',
      drivingLicense: '',
      insuranceDocuments: '',
    ),
    id: '',
    name: '',
    phone: '',
    status: '',
    store: '',
    overallDocumentStatus: '',
    isActive: false,
    assignedOrders: [],
    totalDeliveries: 0,
    totalAccepted: 0,
    totalRejected: 0,
    rating: 0,
    lastActive: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    orderStats: OrderStats(total: 0, completed: 0, ongoing: 0),
  );

  ProfileData get profileData => _profileData;

  bool _isprofileLoading = false;
  bool get isProfileLoading => _isprofileLoading;

  set isProfileLoading(bool value) {
    _isprofileLoading = value;
    notifyListeners();
  }

  bool _isAccountDeleting = false;
  bool get isAccountDeleting => _isAccountDeleting;

  set isAccountDeleting(bool value) {
    _isAccountDeleting = value;
    notifyListeners();
  }

  bool _isprofileUpdating = false;
  bool get isprofileUpdating => _isprofileUpdating;

  set isprofileUpdating(bool value) {
    _isprofileUpdating = value;
    notifyListeners();
  }

  DocumentData _documentData = DocumentData(
    documentStatus: DocumentStatusData(
      idProof: '',
      addressProof: '',
      vehicleDocuments: '',
      drivingLicense: '',
      insuranceDocuments: '',
    ),
    overallDocumentStatus: '',
    verificationNotes: VerificationNotesData(),
    status: '',
  );

  DocumentData get documentData => _documentData;

  bool _isDocumentLoading = false;
  bool get isDocumentLoading => _isDocumentLoading;

  set isDocumentLoading(bool value) {
    _isDocumentLoading = value;
    notifyListeners();
  }

  String _name = '';
  String get name => _name;

  set userName(String name) {
    _name = name;
    notifyListeners();
  }

  String _contactus = '';
  String get contactus => _contactus;

  set contactus(String contactus) {
    _contactus = contactus;
    notifyListeners();
  }

  Future<void> fetchDocumentStatus() async {
    isDocumentLoading = true;
    try {
      final result = await _repository.documentStatus();
      if (result.success) {
        debugPrint("Fetched Document Status: $result");
      } else {
        debugPrint("Failed to fetch Document Status: $result");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isDocumentLoading = false;
    }
  }

  Future<void> fetchProfileDetails() async {
    isProfileLoading = true;
    try {
      final result = await _repository.fetchProfileDetails();

      if (result.success) {
        _profileData = result.data;
        userName = result.data.name;
        debugPrint("Fetched Profile Details: $result");
      } else {
        debugPrint("Fetched Profile Details: $result");
      }
    } catch (e) {
      debugPrint("Error in fetchProfileDetails: $e");
    } finally {
      isProfileLoading = false;
    }
  }

  Future<void> editProfile(BuildContext context, String name) async {
    isprofileUpdating = true;
    try {
      final result = await _repository.editProfile(name);

      if (result.success) {
        debugPrint("Profile updated successfully: $result");
        userName = result.data.name;
        fetchProfileDetails();
        ToastMessage.showToast(
          context,
          message: "Profile updated successfully",
          icon: Icon(Icons.check_circle, color: Colors.green),
        );
      } else {
        debugPrint("Failed to update profile: $result");
        ToastMessage.showToast(
          context,
          message: "Failed to update profile",
          icon: Icon(Icons.error, color: Colors.red),
        );
      }
    } catch (e) {
      debugPrint("Error in editProfile: $e");
    } finally {
      isprofileUpdating = false;
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    isAccountDeleting = true;
    try {
      final response = await _repository.deleteAccount();

      if (response.success == true) {
        debugPrint("Account deleted successfully: ${response.message}");
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginscreen,
          (route) => false,
        );
      } else {
        ToastMessage.showToast(
          context,
          message: "Unable to delete Account",
          icon: Icon(Icons.error, color: Colors.red),
        );
      }
    } catch (e) {
      debugPrint("Error in deleteAccount: $e");
    } finally {
      isAccountDeleting = false;
    }
  }

  Future<void> fetchContactUs() async {
    try {
      final result = await _repository.fetchContactUs();
      if (result.success) {
        contactus = result.data.manager.phone;
        debugPrint("Contact Us Fetched: $result");
      } else {
        debugPrint("Failed to fetch Contact Us: $result");
      }
    } catch (e) {
      debugPrint("Error in fetchContactUs: $e");
    }
  }
}
