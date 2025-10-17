import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        surfaceTintColor: colorScheme.onPrimary,
        shadowColor: colorScheme.onPrimary,
        elevation: 0.01,
      ),
      backgroundColor: colorScheme.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: Color(0xFFDEDED1), width: 1.5.w),
                color: Color(0xFFF9F6F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  _buildHeading(
                    "Privacy Policy – Priya Fresh Meats",
                    colorScheme,
                  ),
                  Text(
                    "Effective Date: October 1, 2025",
                    style: GoogleFonts.roboto(
                      color: Color(0xFF19183B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("1. Introduction"),
                  _buildParagraph(
                    "Welcome to Priya Fresh Meat's Delivery Partner Privacy Policy. This policy explains how we collect, use, and protect the personal information of our delivery partners.",
                  ),
                  _buildParagraph(
                    "As a delivery partner, you play a crucial role in our service by ensuring timely and safe delivery of meat, poultry, eggs, and related products to our customers. This privacy policy applies specifically to individuals who provide delivery services through our platform.",
                  ),
                  _buildSubText('Scope of This Policy:'),
                  _buildParagraph(
                    " This policy applies to all delivery partners registered with Priya Fresh Meat.",
                  ),
                  _buildBulletList([
                    "It covers information collected during the application process and throughout your engagement with us.",
                    "It explains how we use location data during delivery operations.",
                    " It outlines your rights regarding your personal information.",
                  ]),
                  _buildParagraph(
                    "By registering as a delivery partner and using our platform, you consent to the practices described in this Privacy Policy. We may update this policy from time to time, and we will notify you of any significant changes.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("2. Information We Collect"),
                  _buildSubText(
                    "We collect various types of information to facilitate delivery operations, ensure security, and process payments. This includes:",
                  ),
                  _buildBulletList([
                    "Personal Identification Information: Full name, date of birth, government-issued ID numbers, contact info (phone, email, address), photograph, background check and driving record info.",
                    "Vehicle Information: Make, model, year, color, license plate, registration, insurance, inspection reports.",
                    "Operational Information: Location data during deliveries, delivery history, performance metrics, customer ratings, communication records.",
                    "Financial Information: Bank account details for payment processing, tax info, earnings and payment history.",
                  ]),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("3. How We Use Your Information"),
                  _buildBulletList([
                    "Service Operations: Verify identity, connect to deliveries, optimize routes, provide customer support.",
                    "Safety and Security: Background checks, monitor service quality, investigate incidents, prevent fraud.",
                    "Payment and Financial Processing: Calculate/process earnings, provide tax documents, resolve payment issues.",
                    "Communication: Send policy updates, delivery info, tips, notifications about promotions/incentives.",
                  ]),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("4. Information Sharing"),
                  _buildBulletList([
                    "With Customers: First name, photo, vehicle info, location (active deliveries) for ETA.",
                    "With Service Providers: Background check providers, payment processors, mapping/navigation services, cloud storage providers.",
                    "For Legal and Safety Reasons: When required by law, to protect rights/property/safety, investigate fraud, or during mergers/acquisitions.",
                  ]),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("5. Data Security"),
                  _buildBulletList([
                    "Encryption of data in transit and at rest.",
                    "Regular security assessments and vulnerability testing.",
                    "Access controls limiting who can access your personal data.",
                    "Secure authentication methods for app access.",
                    "Regular staff training on data protection.",
                    "Keep login credentials confidential.",
                    "Use strong, unique passwords and log out on shared devices.",
                    "Notify immediately if unauthorized access is suspected.",
                  ]),
                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("6. Data Retention"),
                  _buildBulletList([
                    "Account info: Retained 3 years after deactivation.",
                    "Delivery records: Retained 2 years.",
                    "Financial info: Retained 7 years.",
                    "Location data: Deleted within 90 days, unless needed for investigations.",
                  ]),
                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("7. Your Rights"),
                  _buildBulletList([
                    "Access: Request copies of personal data.",
                    "Rectification: Request correction of inaccurate info.",
                    "Erasure: Request deletion of personal data.",
                    "Restriction: Limit how data is used.",
                    "Portability: Request transfer of data to another organization.",
                    "Objection: Object to certain processing activities.",
                    "To exercise rights, contact us using the 'Contact Us' section. Verification may be required.",
                  ]),
                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("8. Contact Us"),
                  _buildBulletList([
                    "Email: priyafreshmeats@gmail.com",
                    "Phone: +91 9686068687 & +91 9845052666",
                    "Address: No.175, 1st Floor, 15th Main, M C Layout, Vprov, Vijaya Nagar, Bengaluru, Karnataka, 560040",
                    "In-app: Use the Help section in your delivery partner app",
                    "Data Protection Officer (DPO) oversees privacy-related questions.",
                  ]),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  SizedBox(height: 10.h),
                  _buildParagraph(
                    "Acknowledgement:\nBy using the Priya Fresh Meats delivery partner platform, you acknowledge that you have read and understood this Privacy Policy and agree to the collection, use, and sharing of your information as described herein.",
                  ),

                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text, ColorScheme color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: color.scrim,
        ),
      ),
    );
  }

  Widget _buildSubText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF19183B),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 15.sp,
          color: Color(0xFF19183B),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xFFD32F2F),
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
                            color: Color(0xFF19183B),
                            fontWeight: FontWeight.w500,
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
