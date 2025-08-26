import 'package:priya_freshmeats_delivery/utils/exports.dart';

class MydocumentsScreen extends StatelessWidget {
  const MydocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Documents',
          style: GoogleFonts.poppins(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16).r,
        children: [
          DocumentCard(
            title: 'Driving License',
            description: 'Government-issued driving license',
            icon: Icons.card_travel,
          ),
          SizedBox(height: 16.h),
          DocumentCard(
            title: 'Aadhaar Card',
            description: 'Unique Identification Authority of India',
            icon: Icons.perm_identity,
          ),
        ],
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const DocumentCard({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorsheme = Theme.of(context).colorScheme;
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
        leading: Icon(icon, size: 30.sp, color: colorsheme.primary),
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
        trailing: Icon(
          Icons.verified,
          size: 25.sp,
          color: Colors.green.shade400,
        ),
        onTap: () {},
      ),
    );
  }
}
