import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view/profile/delete_dialog.dart';
import 'package:priya_freshmeats_delivery/view/profile/edit_dialog.dart';
import 'package:priya_freshmeats_delivery/view/profile/logout_dialog.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> makePhoneCall(String countrycode, String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: countrycode + phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final profileProvider = Provider.of<ProfileViewmodel>(
        context,
        listen: false,
      );
      await profileProvider.fetchProfileDetails();
      await profileProvider.fetchContactUs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        top: false,
        child: Consumer<ProfileViewmodel>(
          builder: (context, profileProvider, child) {
            return Skeletonizer(
              enabled: profileProvider.isProfileLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 35.h,
                        horizontal: 16.w,
                      ),
                      color: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              "assets/images/profilelogo.jpg",
                              height: 80.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  profileProvider.profileData.name,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryBlack,
                                    fontSize: 20.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  profileProvider.profileData.phone,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primaryBlackshade,
                                    fontSize: 15.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          buildRowWithIcon(
                            () async {
                              final number = profileProvider.contactus;
                              await makePhoneCall('+91', number);
                            },
                            Icons.call_outlined,
                            "Contact Us",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.mydocumentsscreen,
                              );
                            },
                            FontAwesomeIcons.file,
                            "My Documents",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              showEditNameDialog(
                                context,
                                currentName: profileProvider.profileData.name,
                              );
                            },
                            FontAwesomeIcons.penToSquare,
                            "Edit Profile",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.termsandconditions,
                              );
                            },
                            Icons.file_open_outlined,
                            "Terms & Conditions",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.privacypolicyscreen,
                              );
                            },
                            FontAwesomeIcons.shieldHalved,
                            "Privacy Policy",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              showDeleteAccountDialog(context);
                            },
                            FontAwesomeIcons.trashCan,
                            "Delete Account",
                          ),
                          Divider(color: colorScheme.tertiary),

                          buildRowWithIcon(
                            () {
                              showLogoutDialog(context);
                            },
                            FontAwesomeIcons.arrowRightFromBracket,
                            "Logout",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildRowWithIcon(
    VoidCallback ontap,
    IconData icon,
    String label, [
    Color? iconColor,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: InkWell(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon, color: const Color(0xFF7D7C7C), size: 22.sp),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: AppColor.primaryBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FaIcon(
              Icons.keyboard_arrow_right_outlined,
              color: const Color(0xFF7D7C7C),
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
