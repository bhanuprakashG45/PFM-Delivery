import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MydocumentsScreen extends StatefulWidget {
  const MydocumentsScreen({super.key});

  @override
  State<MydocumentsScreen> createState() => _MydocumentsScreenState();
}

class _MydocumentsScreenState extends State<MydocumentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = Provider.of<ProfileViewmodel>(
        context,
        listen: false,
      );
      profileProvider.fetchDocumentStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor:colorscheme.onPrimary,
      appBar: AppBar(
        title: Text(
          'My Documents',
          style: GoogleFonts.poppins(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
          
        ),
        surfaceTintColor: colorscheme.onPrimary,
        centerTitle: true,
        shadowColor: colorscheme.onPrimary,
        elevation: 0.01,
        backgroundColor: colorscheme.onPrimary,

      ),
      body: SafeArea(
        top: false,
        child: Consumer<ProfileViewmodel>(
          builder: (context, profileProvider, child) {
            final docStatus = profileProvider.profileData.documentStatus;
            final overallStatus =
                profileProvider.profileData.overallDocumentStatus;
            final overallColor =
                overallStatus.toLowerCase() == 'pending'
                    ? Colors.red
                    : Colors.green;
        
            return Skeletonizer(
              enabled: profileProvider.isDocumentLoading,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Overall Document Status:',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Icon(Icons.circle, size: 16.sp, color: overallColor),
                        SizedBox(width: 5.w),
                        Text(
                          overallStatus.toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: overallColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
        
                  DocumentCard(
                    title: 'Driving License',
                    description: 'Government-issued driving license',
                    icon: Icons.card_travel,
                    status: docStatus.drivingLicense,
                  ),
                  SizedBox(height: 16.h),
                  DocumentCard(
                    title: 'Aadhaar Card',
                    description: 'Unique Identification Authority of India',
                    icon: Icons.perm_identity,
                    status: docStatus.idProof,
                  ),
                  SizedBox(height: 16.h),
                  DocumentCard(
                    title: 'Vehicle Documents',
                    description: 'Your registered vehicle documents',
                    icon: Icons.directions_car,
                    status: docStatus.vehicleDocuments,
                  ),
                  SizedBox(height: 16.h),
                  DocumentCard(
                    title: 'Address Proof',
                    description: 'Government-issued address proof',
                    icon: Icons.home,
                    status: docStatus.addressProof,
                  ),
                  SizedBox(height: 16.h),
                  // DocumentCard(
                  //   title: 'Insurance Documents',
                  //   description: 'Vehicle insurance documents',
                  //   icon: Icons.shield,
                  //   status: docStatus.insuranceDocuments,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String status;

  const DocumentCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final statusColor =
        status.toLowerCase() == 'pending' ? Colors.red : Colors.green;
    final statusText =
        status.toLowerCase() == 'pending' ? 'Pending' : 'Verified';

    return Container(
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
        borderRadius: BorderRadius.circular(25).r,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16).r,
        leading: Icon(icon, size: 30.sp, color: colorscheme.primary),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: AppColor.secondaryBlack,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, size: 20.sp, color: statusColor),
            SizedBox(width: 5.w),
            Text(
              statusText,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
