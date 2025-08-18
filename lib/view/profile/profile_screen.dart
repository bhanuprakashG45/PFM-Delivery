import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view/profile/delete_dialog.dart';
import 'package:priya_freshmeats_delivery/view/profile/edit_dialog.dart';
import 'package:priya_freshmeats_delivery/view/profile/logout_dialog.dart';

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

  String name = "Bhanuprakash";

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: CrescentMoonClipper(),
                child: Container(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [colorScheme.primary, colorScheme.inversePrimary],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0).r,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60).r,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Bhanuprakash",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onError,
                            fontSize: 28.sp,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRowWithIcon(
                      () async {
                        await makePhoneCall('+91', "9876543210");
                      },
                      Icons.phone_sharp,
                      "Contact Us",
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Divider(),
                    ),
                    buildRowWithIcon(
                      () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.mydocumentsscreen,
                        );
                      },
                      FontAwesomeIcons.fileContract,
                      "My Documents",
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Divider(),
                    ),
                    buildRowWithIcon(
                      () {
                        Navigator.pushNamed(context, RoutesName.ordersscreen);
                      },
                      Icons.restaurant_menu_outlined,
                      "Orders",
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Divider(),
                    ),

                    buildRowWithIcon(
                      () {
                        showEditNameDialog(context, currentName: name);
                      },
                      Icons.edit,
                      "Edit Profile",
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Divider(),
                    ),

                    buildRowWithIcon(
                      () {
                        showDeleteAccountDialog(context);
                      },
                      FontAwesomeIcons.trashCan,
                      "Delete Account",
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Divider(),
                    ),

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
      ),
    );
  }

  Widget buildRowWithIcon(
    VoidCallback ontap,
    IconData icon,
    String label, [
    Color? iconColor,
  ]) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon, color: colorScheme.outline, size: 22.sp),
            SizedBox(width: 15.w),
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: GoogleFonts.alata(
                  fontSize: 20.sp,
                  color: colorScheme.shadow,
                ),
              ),
            ),

            FaIcon(Icons.keyboard_arrow_right_outlined, size: 30.sp),
          ],
        ),
      ),
    );
  }
}

class CrescentMoonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;
    final curveHeight = height * 0.3;

    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.quadraticBezierTo(width * 0.5, height - curveHeight * 1, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
