import 'package:flutter/material.dart';
import 'package:priya_freshmeats_delivery/res/constants/color.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class NotDeliveredScreen extends StatefulWidget {
  const NotDeliveredScreen({super.key});

  @override
  State<NotDeliveredScreen> createState() => _NotDeliveredScreenState();
}

class _NotDeliveredScreenState extends State<NotDeliveredScreen> {
  final List<String> reasons = [
    'Customer not available',
    'Wrong address',
    'Payment issue',
    'Order cancelled by customer',
    'Other',
  ];

  String? selectedReason;

  void handleSubmit() {
    if (selectedReason == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a reason')));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marked as not delivered: $selectedReason')),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.bottomnavbar,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Not Delivered',
          style: TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 20).r,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0).r,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "John Doe",
                              style: GoogleFonts.alata(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Chicken curry cut with skin,a pop of flavor and a hint of spice, perfect for your next meal.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 2.0.w),
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: const Color.fromARGB(255, 251, 103, 93),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                "JayaNagar, Bangalore, Karnataka.",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),

                Text(
                  'Select Reason for Not Delivering:',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),

                DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(10).r,
                  value: selectedReason,
                  items:
                      reasons.map((reason) {
                        return DropdownMenuItem(
                          value: reason,
                          child: Text(reason),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.secondary,
                        width: 1,
                      ),
                    ),
                    hintText: 'Choose reason',

                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                  // dropdownColor: colorScheme.secondaryContainer,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: handleSubmit,

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
