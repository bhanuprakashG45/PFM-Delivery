import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya_freshmeats_delivery/res/constants/color.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.onPrimary,
        surfaceTintColor: colorScheme.onPrimary,
        shadowColor: colorScheme.onPrimary,
        elevation: 0.01,
      ),
      backgroundColor: colorScheme.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                _buildHeading("Privacy Policy – Priya Fresh Meats"),
                _buildSubText("Effective Date: [Insert Date]"),

                _buildSectionTitle("1. Introduction"),
                _buildBulletList([
                  "This Privacy Policy explains how we collect, use, and protect your personal information.",
                  "By using the Priya Fresh Meats Delivery App, you consent to the data practices described here.",
                ]),

                _buildSectionTitle("2. Information We Collect"),
                _buildBulletList([
                  "Personal details: Name, phone number, address, etc.",
                  "Location data during active deliveries.",
                  "Device and usage data such as IP address, app version, and crash reports.",
                ]),

                _buildSectionTitle("3. How We Use Your Data"),
                _buildBulletList([
                  "To verify your identity and onboard you.",
                  "To assign and track deliveries.",
                  "For support, payment processing, and communication.",
                  "To improve app functionality and user experience.",
                ]),

                _buildSectionTitle("4. Data Sharing"),
                _buildBulletList([
                  "Your information is shared only with authorized personnel within Priya Fresh Meats.",
                  "We do not sell or rent your personal information to third parties.",
                  "We may disclose information if required by law or to protect rights and safety.",
                ]),

                _buildSectionTitle("5. Data Security"),
                _buildBulletList([
                  "Your data is stored securely with restricted access.",
                  "We implement reasonable measures to prevent unauthorized access or misuse.",
                ]),

                _buildSectionTitle("6. Your Rights"),
                _buildBulletList([
                  "You can request access, correction, or deletion of your data.",
                  "You can contact us to withdraw consent or opt out of communications.",
                ]),

                _buildSectionTitle("7. Cookies & Tracking"),
                _buildBulletList([
                  "We may use tracking technologies to understand app usage and improve performance.",
                ]),

                _buildSectionTitle("8. Third-Party Services"),
                _buildBulletList([
                  "Our app may contain links to third-party services (e.g., payment gateways).",
                  "We are not responsible for their privacy practices.",
                ]),

                _buildSectionTitle("9. Policy Updates"),
                _buildBulletList([
                  "This policy may be updated periodically.",
                  "We encourage you to review it regularly.",
                ]),

                _buildSectionTitle("10. Contact Us"),
                _buildBulletList([
                  "If you have questions about this policy, contact us at:",
                  "Phone: +91 9845052666",
                  "Email: priyafreshmeats@gmail.com",
                ]),

                SizedBox(height: 20.h),
                Text(
                  "By using the app, you acknowledge that you have read and understood this Privacy Policy.",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryBlack,
        ),
      ),
    );
  }

  Widget _buildSubText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 15.sp, color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          items
              .map(
                (item) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("• ", style: TextStyle(fontSize: 15.sp)),
                      Expanded(
                        child: Text(
                          item,
                          style: GoogleFonts.roboto(
                            fontSize: 15.sp,
                            color: Colors.grey[800],
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
