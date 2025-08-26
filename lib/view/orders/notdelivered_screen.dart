import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';

class NotDeliveredScreen extends StatefulWidget {
  final orderId;
  const NotDeliveredScreen({super.key, this.orderId});

  @override
  State<NotDeliveredScreen> createState() => _NotDeliveredScreenState();
}

class _NotDeliveredScreenState extends State<NotDeliveredScreen> {
  final List<String> reasons = [
    'customer_not_available',
    'wrong_address',
    'payment_issue',
    'order_cancelled',
    'other',
  ];

  String? selectedReason;

  void handleSubmit() async {
    final ordersprovider = Provider.of<OrdersViewmodel>(context, listen: false);
    if (selectedReason == null) {}

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marked as not delivered: $selectedReason')),
    );
    if (selectedReason!.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a reason')));
      return;
    } else {
      await ordersprovider.notDelivered(
        context,
        widget.orderId,
        selectedReason!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Not Delivered',
          style: GoogleFonts.poppins(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.onPrimary,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 230, 229, 229),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        spreadRadius: -4,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],

                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0).r,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "John Doe",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
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
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.secondaryBlack,
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
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryBlackshade,
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
                SizedBox(height: 10.h),

                Text(
                  'Select Reason for Not Delivering:',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
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
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                  dropdownColor: colorScheme.onPrimary,
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
                      textStyle: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
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
