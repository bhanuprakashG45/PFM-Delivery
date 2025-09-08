import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
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
                _buildHeading(
                  "Terms & Conditions for Delivery Partners – Priya Fresh Meats",
                ),
                _buildSubText("Effective Date: [Insert Date]"),

                _buildSectionTitle("1. Eligibility"),
                _buildBulletList([
                  "Must be 18+ years old.",
                  "Must hold valid ID and driver’s license (if applicable).",
                  "Must own a smartphone with GPS and internet access.",
                ]),

                _buildSectionTitle("2. Onboarding & Verification"),
                _buildBulletList([
                  "Submission of valid KYC documents is required.",
                  "The company may verify your background before activation.",
                ]),

                _buildSectionTitle("3. Responsibilities"),
                _buildBulletList([
                  "Deliver orders promptly and safely.",
                  "Handle items with care.",
                  "Maintain professionalism and politeness.",
                ]),

                _buildSectionTitle("4. Code of Conduct"),
                _buildBulletList([
                  "No misbehavior or harassment.",
                  "No tampering or consuming products.",
                  "No drug or alcohol use during duty.",
                ]),

                _buildSectionTitle("5. Payments"),
                _buildBulletList([
                  "Payments are based on completed deliveries and incentives.",
                  "Credited [weekly/monthly] to your registered bank account.",
                  "You are responsible for your taxes.",
                ]),

                _buildSectionTitle("6. App Usage"),
                _buildBulletList([
                  "Keep login credentials secure.",
                  "Enable GPS during delivery hours.",
                  "Do not use the app for unauthorized purposes.",
                ]),

                _buildSectionTitle("7. Data Privacy"),
                _buildBulletList([
                  "Your data is collected for verification, tracking, and payment.",
                  "Stored securely and used as per company policy.",
                ]),

                _buildSectionTitle("8. Termination"),
                _buildBulletList([
                  "The company can suspend/terminate for policy violations or misconduct.",
                  "You may resign at any time with notice.",
                ]),

                _buildSectionTitle("9. Damage or Loss"),
                _buildBulletList([
                  "You’re liable for product loss/damage due to negligence.",
                  "Immediately report theft, breakdowns, or loss.",
                ]),

                _buildSectionTitle("10. Amendments"),
                _buildBulletList([
                  "The company may update these terms at any time.",
                  "Continued use means acceptance of changes.",
                ]),

                _buildSectionTitle("11. Contact"),
                _buildBulletList([
                  "Support:",
                  "Phone: + 91 9686068687",
                  "Email: priyafreshmeats@gmail.com",
                ]),

                SizedBox(height: 20.h),
                Text(
                  "By continuing to use the app, you agree to these Terms & Conditions.",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 50.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
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
                  padding:  EdgeInsets.symmetric(vertical: 2.h),
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
