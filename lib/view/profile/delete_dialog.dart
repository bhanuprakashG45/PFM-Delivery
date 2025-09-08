import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';

void showDeleteAccountDialog(BuildContext context) {
  final SharedPref _pref = SharedPref();
  showDialog(
    context: context,
    builder: (context) {
      return Consumer<ProfileViewmodel>(
        builder: (context, profileprovider, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text(
              'Delete Account',
              style: GoogleFonts.poppins(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Text(
              'Are you sure you want to delete your account?',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.primaryBlackshade,
              ),
            ),
            actionsPadding: EdgeInsets.only(bottom: 10.h, right: 10.w),
            actions: [
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close_rounded, color: AppColor.textWhite),
                    label: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: AppColor.textWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed:
                        profileprovider.isAccountDeleting
                            ? null
                            : () async {
                              await _pref.clearAccessToken();
                              await _pref.clearRefreshToken();
                              await profileprovider.deleteAccount(context);
                              // Navigator.pushNamedAndRemoveUntil(
                              //   context,
                              //   RoutesName.loginscreen,
                              //   (route) => false,
                              // );
                            },
                    icon: Icon(Icons.delete, color: AppColor.primaryBlack),
                    label:
                        profileprovider.isAccountDeleting
                            ? SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              'Delete',
                              style: GoogleFonts.poppins(
                                color: AppColor.primaryBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
