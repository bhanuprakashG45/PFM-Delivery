import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.all(10).r,
              color: colorscheme.onPrimary,
              child: Column(
                children: [
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 26.sp,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 45.r,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.person, size: 48.sp),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor: colorscheme.secondary,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 0.7,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0.h,
                            width: 5.0.w,  
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: colorscheme.secondary,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Personal Details",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: colorscheme.onPrimary,
                            ),
                          ),
                          Spacer(),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 18.sp,
                              color: colorscheme.onPrimary,
                            ),
                            label: Text(
                              isEditable ? "Done" : "Edit",
                              style: TextStyle(
                                color: colorscheme.onPrimary,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: colorscheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: colorscheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Bhanu Prakash",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: colorscheme.secondary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Divider(color: Colors.grey.shade300),
                                  SizedBox(height: 12.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mobile",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: colorscheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "+91 1234567890",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: colorscheme.secondary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Divider(color: Colors.grey.shade300),
                                  SizedBox(height: 12.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: colorscheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "#123, 3rd Floor, ABC Street,\nXYZ City, India",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: colorscheme.secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Divider(color: Colors.grey.shade300),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.logout,
                            color: colorscheme.primaryContainer,
                          ),
                          label: Text(
                            "Logout",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorscheme.onPrimary,
                            foregroundColor: colorscheme.primaryContainer,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
