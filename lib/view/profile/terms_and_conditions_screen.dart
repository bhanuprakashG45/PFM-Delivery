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
                    "Terms & Conditions for Delivery Partners – Priya Fresh Meats",
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
                    "Welcome to Priya Fresh Meats's Delivery Partner Terms and Conditions. These terms govern your relationship with Priya Fresh Meats as a delivery partner and outline your rights and responsibilities.",
                  ),
                  _buildParagraph(
                    "By registering as a delivery partner and using our platform, you agree to be bound by these Terms and Conditions. Please read them carefully before using our services.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("2. Eligibility Requirements"),
                  _buildSubText("To become a delivery partner, you must:"),
                  _buildBulletList([
                    "Be at least 21 years of age",
                    "Possess a valid driver's license appropriate for your vehicle type",
                    "Have valid vehicle insurance and registration",
                    "Pass a background check and driving record review",
                    "Own a smartphone capable of running our delivery partner application",
                    "Have a valid bank account for payment processing",
                  ]),
                  _buildParagraph(
                    "Priya Fresh Meats reserves the right to verify all provided documentation and conduct additional checks as necessary. We may refuse service to anyone at our sole discretion.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("3. Service Provision"),
                  _buildSubText("As a delivery partner, you agree to:"),
                  _buildBulletList([
                    "Maintain proper temperature control for perishable items during delivery",
                    "Follow all food safety guidelines and handling procedures",
                    "Provide professional and courteous service to customers",
                    "Use the designated thermal bags and packaging provided",
                    "Follow the most efficient delivery routes as suggested by our platform",
                    "Report any delivery issues or customer concerns promptly",
                  ]),
                  _buildParagraph(
                    "You are responsible for ensuring that deliveries are made within the specified timeframes and that products maintain their quality during transit.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("4. Compensation & Payments"),
                  _buildSubText("Payment Structure:"),
                  _buildBulletList([
                    "Base delivery fee per completed delivery",
                    "Distance-based compensation for deliveries beyond standard radius",
                    "Incentives for peak-time deliveries and high-volume periods",
                    "Performance bonuses based on customer ratings and delivery metrics",
                  ]),
                  _buildSubText("Payment Terms:"),
                  _buildBulletList([
                    "Payments are processed weekly via direct deposit",
                    "A detailed earnings statement is available in your partner portal",
                    "You are responsible for reporting your earnings for tax purposes",
                    "Priya Fresh Meats will provide necessary tax documentation (e.g., 1099 forms)",
                  ]),
                  _buildParagraph(
                    "Priya Fresh Meats reserves the right to adjust compensation rates with prior notice. Deductions may be made for lost or damaged products attributable to delivery partner negligence.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("5. Equipment & Materials"),
                  _buildSubText("Provided by Priya Fresh Meats:"),
                  _buildBulletList([
                    "Thermal delivery bags to maintain product temperature",
                    "Branded materials (optional) for vehicle identification",
                    "Access to the delivery partner application and platform",
                    "Customer support and operational guidance",
                  ]),
                  _buildSubText("Your Responsibility:"),
                  _buildBulletList([
                    "Maintaining a reliable vehicle in good working condition",
                    "Smartphone with data plan for using the delivery app",
                    "Proper storage for thermal bags when not in use",
                    "Cleaning and maintaining all provided equipment",
                  ]),
                  _buildParagraph(
                    "You agree to return all Priya Fresh Meats property upon termination of our agreement. Fees may be charged for unreturned or damaged equipment.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  _buildSectionTitle("6. Vehicle Requirements"),
                  _buildBulletList([
                    "Valid registration and inspection stickers",
                    "Comprehensive auto insurance that covers commercial delivery activities",
                    "Proper functioning air conditioning/heating for temperature control",
                    "Clean interior free of odors that could affect food quality",
                    "Sufficient space to accommodate delivery orders",
                  ]),
                  _buildParagraph(
                    "You are responsible for all vehicle-related expenses including fuel, maintenance, insurance, and repairs. Priya Fresh Meats is not liable for any vehicle-related incidents that occur during delivery activities.",
                  ),

                  Divider(color: Color(0xFFDEDED1), thickness: 1),

                  SizedBox(height: 10.h),
                  Text(
                    "Acknowledgement of Terms:\nBy registering as a delivery partner and using the Priya Fresh Meats platform, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. You affirm that you meet all eligibility requirements and will comply with all provisions outlined herein.",
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      color: Color(0xFF19183B),
                      fontWeight: FontWeight.w500,
                    ),
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

  Widget _buildHeading(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
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
