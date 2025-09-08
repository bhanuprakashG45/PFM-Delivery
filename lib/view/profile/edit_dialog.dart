import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';

void showEditNameDialog(BuildContext context, {required String currentName}) {
  final TextEditingController nameController = TextEditingController(
    text: currentName,
  );

  showDialog(
    context: context,
    builder: (context) {
      return Consumer<ProfileViewmodel>(
        builder: (context, profileProvider, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
            title: Text(
              'Edit Name',
              style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: AppColor.primaryBlackshade,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
                        profileProvider.isprofileUpdating
                            ? null
                            : () async {
                              final newName = nameController.text.trim();
                              await profileProvider.editProfile(
                                context,
                                newName,
                              );
                              if (newName.isNotEmpty) {
                                Navigator.of(context).pop();
                              }
                            },
                    icon: Icon(Icons.save, color: AppColor.primaryBlack),
                    label:
                        profileProvider.isprofileUpdating
                            ? SizedBox(
                              height: 10.h,
                              width: 10.w,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              'Save',
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
