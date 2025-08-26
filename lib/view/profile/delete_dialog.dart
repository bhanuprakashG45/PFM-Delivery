import 'package:priya_freshmeats_delivery/utils/exports.dart';

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.loginscreen,
                    (route) => false,
                  );
                },
                icon: Icon(Icons.delete, color: AppColor.primaryBlack),
                label: Text(
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
}
